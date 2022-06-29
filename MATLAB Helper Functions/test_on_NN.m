function test_on_NN(dlnet, XTest, YTest)
    Y1Test = YTest(:,4);
    Y2Test = YTest(:,1:3);
    
    %Defining dsTest
    dsX1Test = arrayDatastore(XTest(:,1));
    dsX2Test = arrayDatastore(XTest(:,2));
    dsY1 = arrayDatastore(YTest(:,1));
    dsY2 = arrayDatastore(YTest(:,2));
    dsY3 = arrayDatastore(YTest(:,3));
    dsY4 = arrayDatastore(YTest(:,4));

    dsTest = combine(dsX1Test,dsX2Test,dsY4, dsY1,dsY2,dsY3);
    
    %minibatchqueue used to process and manage mini-batches 
    mbq = minibatchqueue(dsTest, 'MiniBatchSize', size(XTest, 1), 'MiniBatchFormat', {'', '', '', '', '', ''});
    
    while hasdata(mbq)
    
        % Read mini-batch of data.
        [dlX1, dlX2,dlY1,dlY2,dlY3,dlY4] = next(mbq);
            dlXTest = [dlX1, dlX2]';
            size(dlXTest)
            dlXTest = dlarray(dlXTest, 'CB');
            
        % Make predictions using the predict function.
        [dlY1Pred] = predict(dlnet,dlXTest,'Outputs',["output"]);
        
        % Determine predicted classes.
%         classesPredictions = dlY1Pred;

        % Dermine predicted angles
        Y2PredBatch = extractdata(dlY1Pred);
        size(Y2PredBatch)
        Y3Pred = Y2PredBatch(:,2);
        Y4Pred = Y2PredBatch(:,3);
        Y2Pred = Y2PredBatch(:,1);
        anglesPredictions = Y2PredBatch;
        
        classesPredictions = Y2PredBatch(1, :)';
        cps = size(classesPredictions)
        y1t = size(Y1Test)
        switchs = [classesPredictions Y1Test];
        switchs = switchs(1:10, :)
        % Compare predicted and true classes
        classCorr = [round(classesPredictions) == Y1Test];
%         y2p = size(Y2PredBatch)
%         y2t = size(Y2Test)
        % Compare predicted and true angles
        angleDiffBatch = Y2PredBatch(2:4, :)' - Y2Test;
        angleDiff = angleDiffBatch;

    end
    cc = size(classCorr)
    accuracy = mean(classCorr)
    angleRMSE = sqrt(mean(angleDiff.^2))
    Y2PredBatch = Y2PredBatch(2:4, :)';
    
    s1 = [Y2PredBatch(:, 1) Y2Test(:, 1)];
    s2 = [Y2PredBatch(:, 2) Y2Test(:, 2)];
    s3 = [Y2PredBatch(:, 3) Y2Test(:, 3)];
     
    s1 = s1(1:10, :)
    s2 = s2(1:10, :)
    s3 = s3(1:10, :)
    
%     arr = [classesPredictions; Y1Test'];
%     a = classesPredictions(:);
%     b = Y1Test(:);
%     x = [a b]
end