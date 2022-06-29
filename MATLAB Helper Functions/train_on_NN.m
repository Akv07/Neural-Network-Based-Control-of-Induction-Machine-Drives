function dlnet = train_on_NN(XTrain, YTrain)
    %Define architecture of model
    inp = featureInputLayer(2, 'Name', 'input');
    fc1 = fullyConnectedLayer(4, 'Name', 'fc1');
%     fc2 = fullyConnectedLayer(5, 'Name', 'fc2');
%     fc3 = fullyConnectedLayer(5, 'Name', 'fc3');
    out = fullyConnectedLayer(3, 'Name', 'output');
%     sft = softmaxLayer('Name', 'softmax');
    
    layers = [inp fc1 out];
    
    lgraph = layerGraph(layers);
%     
%     % Add layer for regression
%     layers = fullyConnectedLayer(3, 'Name', 'fc2');
%     lgraph = addLayers(lgraph, layers);
%     lgraph = connectLayers(lgraph, 'fc1', 'fc2');
    
    figure
    plot(lgraph)

    %Create a Deep Learning Network using lgraph
    dlnet = dlnetwork(lgraph);
    
    %Training Parameters
    numEpochs = 300;
    miniBatchSize = size(XTrain,1);
    
    plots = "training-progress";
    
    %Defining dsTrain
    dsX1Train = arrayDatastore(XTrain(:,1));
    dsX2Train = arrayDatastore(XTrain(:,2));
    dsY1 = arrayDatastore(YTrain(:,1));
    dsY2 = arrayDatastore(YTrain(:,2));
    dsY3 = arrayDatastore(YTrain(:,3));
    dsY4 = arrayDatastore(YTrain(:,4));

    dsTrain = combine(dsX1Train,dsX2Train,dsY4, dsY1,dsY2,dsY3);
    
    %minibatchqueue used to process and manage mini-batches 
    mbq = minibatchqueue(dsTrain, 'MiniBatchSize', miniBatchSize, 'MiniBatchFormat', {'', '', '', '', '', ''});
    
    %Initialising the training progress plot
    if plots == "training-progress"
        figure
        lineLossTrain = animatedline('Color',[0.85 0.325 0.098]);
        ylim([0 inf])
        xlabel("Iteration")
        ylabel("Loss")
        grid on
    end
    
    %Initialising parameters for Adam
    trailingAvg = [];
    trailingAvgSq = [];
    
    %TRAINING THE MODEL
    iteration = 0;
    start = tic;

    % Loop over epochs.
    for epoch = 1:numEpochs

        % Shuffle data.
        shuffle(mbq)

        % Loop over mini-batches
        while hasdata(mbq)

            iteration = iteration + 1;

            [dlX1, dlX2,dlY1,dlY2,dlY3,dlY4] = next(mbq);
%             dly1 = dlY1
            dlX = [dlX1, dlX2]';
%             size(dlX)
%             dlY1 = onehotencode(extractdata(dlY1), 1)
%             dly1bef = size(dlY1)
            dlX = dlarray(dlX, 'CB');
%             dlX = reshape(dlX, miniBatchSize, 2);
            size(dlX)
%             dlY1 = dlarray(dlY1, 'CB');
%             dlY2 = dlarray(dlY2, 'CB');
%             dlY3 = dlarray(dlY3, 'CB');
%             dlY4 = dlarray(dlY4, 'CB');
            % Evaluate the model gradients, state, and loss using dlfeval and the
            % modelGradients function.
            [gradients,state,loss] = dlfeval(@modelGradients, dlnet, dlX, dlY1, dlY2, dlY3, dlY4);
            dlnet.State = state;
            print("DONE");
            % Update the network parameters using the Adam optimizer.
            [dlnet,trailingAvg,trailingAvgSq] = adamupdate(dlnet,gradients, ...
                trailingAvg,trailingAvgSq,iteration);

            % Display the training progress.
            if plots == "training-progress"
                D = duration(0,0,toc(start),'Format','hh:mm:ss');
                addpoints(lineLossTrain,iteration,double(gather(extractdata(loss))))
                title("Epoch: " + epoch + ", Elapsed: " + string(D))
                drawnow
            end
        end
    end
    
end