function net = train_on_NN_2(XTrain, YTrain)
    XTrain = featureExpand(XTrain);

   numFeatures = size(XTrain,2);
   numOutputs = size(YTrain, 2);
   
   learn_rate = 0.05;
   mini_batch_size = size(XTrain, 1);
   learn_rate_drop_factor = 0.5;
   learn_rate_drop_period = 200;
   l2_regularization_factor =1e-7;
   max_epochs = 4000;
   
%    %Defining NN Architcture
%    layers = [
%             featureInputLayer(numFeatures, 'Normalization',  'none', 'Name', 'Input Layer')
%             
%             fullyConnectedLayer(20, 'Name', 'Hidden Layer 1')
%             tanhLayer('Name', 'tanh1')   
% %             reluLayer('Name', 'relu1')
%             
%             fullyConnectedLayer(20, 'Name', 'Hidden Layer 2')
%             tanhLayer('Name', 'tanh2')
% %             reluLayer('Name', 'relu2')
%             
%             fullyConnectedLayer(3, 'Name', 'Output Layer')
%             sigmoidLayer('Name', 'sigmoid')
%             regressionLayer('Name', 'out')
% 
% %             softmaxLayer('Name', 'softmax')
% %             classificationLayer('Name', 'out')
%             ];
%         lgraph = layerGraph(layers);

    
    %For multiplication layer
    lgraph = layerGraph();
    lgraph = addLayers(lgraph, featureInputLayer(numFeatures, 'Normalization',  'none', 'Name', 'Input Layer'));
    
    lgraph = addLayers(lgraph, fullyConnectedLayer(20, 'Name', 'Hidden Layer 1 subnet 1'));
    lgraph = addLayers(lgraph, tanhLayer('Name', 'tanh1 subnet1'));
    
    lgraph = addLayers(lgraph, fullyConnectedLayer(20, 'Name', 'Hidden Layer 1 subnet 2'));
    lgraph = addLayers(lgraph, tanhLayer('Name', 'tanh1 subnet2'));
    
    lgraph = addLayers(lgraph, multiplicationLayer(2,'Name','multiply'));
    lgraph = addLayers(lgraph, tanhLayer('Name', 'tanh_multiply'));
%     lgraph = addLayers(lgraph, multiplicationLayer(2,'Name','Output 2'));
%     lgraph = addLayers(lgraph, multiplicationLayer(2,'Name','Output 3'));

%     lgraph = addLayers(lgraph, fullyConnectedLayer(10, 'Name', 'Hidden Layer 2'));
%     lgraph = addLayers(lgraph, tanhLayer('Name', 'tanh 2'));
    lgraph = addLayers(lgraph, fullyConnectedLayer(3, 'Name', 'Output Layer'));
    lgraph = addLayers(lgraph, sigmoidLayer('Name', 'sigmoid'));
    lgraph = addLayers(lgraph, regressionLayer('Name', 'out'));
    
    %Connect layers to form NN
    lgraph = connectLayers(lgraph,'Input Layer','Hidden Layer 1 subnet 1');
    lgraph = connectLayers(lgraph,'Input Layer','Hidden Layer 1 subnet 2');
    
    lgraph = connectLayers(lgraph,'Hidden Layer 1 subnet 1', 'tanh1 subnet1');
    lgraph = connectLayers(lgraph,'Hidden Layer 1 subnet 2', 'tanh1 subnet2');
    
    lgraph = connectLayers(lgraph, 'tanh1 subnet1', 'multiply/in1');
    lgraph = connectLayers(lgraph, 'tanh1 subnet2', 'multiply/in2');
    
%     lgraph = connectLayers(lgraph, 'tanh1 subnet1', 'Output 2');
%     lgraph = connectLayers(lgraph, 'tanh1 subnet2', 'Output 2');
%     
%     lgraph = connectLayers(lgraph, 'tanh1 subnet1', 'Output 3');
%     lgraph = connectLayers(lgraph, 'tanh1 subnet2', 'Output 3');

    lgraph = connectLayers(lgraph, 'multiply', 'tanh_multiply');
%     lgraph = connectLayers(lgraph, 'tanh_multiply', 'Hidden Layer 2');
%     
%     lgraph = connectLayers(lgraph, 'Hidden Layer 2', 'tanh 2');
    lgraph = connectLayers(lgraph, 'tanh_multiply', 'Output Layer');
    lgraph = connectLayers(lgraph, 'Output Layer', 'sigmoid');
%     lgraph = connectLayers(lgraph, 'Output 2', 'sigmoid');
%     lgraph = connectLayers(lgraph, 'Output 3', 'sigmoid');
    
    lgraph = connectLayers(lgraph, 'sigmoid', 'out');
    
    
    
    options = trainingOptions('adam', ...
            'Plots','training-progress', ... 
            'InitialLearnRate', learn_rate, ...
            'shuffle', 'every-epoch', ...
            'verbose', false, ...
            'MiniBatchSize', mini_batch_size, ...
            'MaxEpochs', max_epochs, ...
            'LearnRateSchedule', 'piecewise', ...
            'LearnRateDropPeriod', learn_rate_drop_period, ...
            'LearnRateDropFactor', learn_rate_drop_factor, ...
            'L2Regularization', l2_regularization_factor);
    
%      lgraph = layerGraph(layers);
     figure
     plot(lgraph);
     
    %Train the NN
    net = trainNetwork(XTrain, YTrain, lgraph, options);
end