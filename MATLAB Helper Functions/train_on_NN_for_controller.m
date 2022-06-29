function net = train_on_NN_for_controller(XTrain, YTrain)
    XTrain = featureExpandForController(XTrain);

   numFeatures = size(XTrain,2);
   numOutputs = size(YTrain, 2);
   
   learn_rate = 0.02;
   mini_batch_size = size(XTrain, 1);
   learn_rate_drop_factor = 0.8;
   learn_rate_drop_period = 500;
   l2_regularization_factor =0.0001;
   max_epochs = 20000;
   
   %Defining NN Architcture
   layers = [
            featureInputLayer(numFeatures, 'Normalization',  'none', 'Name', 'Input Layer')
            
            fullyConnectedLayer(20, 'Name', 'Hidden Layer 1','BiasInitializer','zeros', 'BiasLearnRateFactor', 0) %,'BiasInitializer','zeros', 'BiasLearnRateFactor', 0
%             tanhLayer('Name', 'tanh1')   
%             reluLayer('Name', 'relu1')
            
%             fullyConnectedLayer(12, 'Name', 'Hidden Layer 2')
%             tanhLayer('Name', 'tanh2')
%             reluLayer('Name', 'relu2')
%             fullyConnectedLayer(8, 'Name', 'Hidden Layer 3')
%             reluLayer('Name', 'relu3')
            fullyConnectedLayer(numOutputs, 'Name', 'Output Layer','BiasInitializer','zeros', 'BiasLearnRateFactor', 0)
%             sigmoidLayer('Name', 'sigmoid')
            regressionLayer('Name', 'out')
            ];
        
        lgraph = layerGraph(layers);
        
    
%     %For multiplication layer
%     lgraph = layerGraph();
%     lgraph = addLayers(lgraph, featureInputLayer(numFeatures, 'Normalization',  'none', 'Name', 'Input Layer'));
%     
%     lgraph = addLayers(lgraph, fullyConnectedLayer(12, 'Name', 'Hidden Layer 1'));
% %     lgraph = addLayers(lgraph, reluLayer('Name', 'tanh1'));
%     
% %     lgraph = addLayers(lgraph, fullyConnectedLayer(16, 'Name', 'Hidden Layer 2 subnet 1'));
% %     lgraph = addLayers(lgraph, reluLayer('Name', 'tanh2 subnet1'));
%     
%     lgraph = addLayers(lgraph, fullyConnectedLayer(20, 'Name', 'Hidden Layer 2'));
% %     lgraph = addLayers(lgraph, reluLayer('Name', 'tanh2 subnet2'));
%     
%     lgraph = addLayers(lgraph, multiplicationLayer(3,'Name','multiply'));
% %     lgraph = addLayers(lgraph, reluLayer('Name', 'tanh_multiply'));
% %     lgraph = addLayers(lgraph, multiplicationLayer(2,'Name','Output 2'));
% %     lgraph = addLayers(lgraph, multiplicationLayer(2,'Name','Output 3'));
% 
% %     lgraph = addLayers(lgraph, fullyConnectedLayer(10, 'Name', 'Hidden Layer 2'));
% %     lgraph = addLayers(lgraph, tanhLayer('Name', 'tanh 2'));
%     lgraph = addLayers(lgraph, fullyConnectedLayer(numOutputs, 'Name', 'Output Layer'));
% %     lgraph = addLayers(lgraph, sigmoidLayer('Name', 'sigmoid'));
%     lgraph = addLayers(lgraph, regressionLayer('Name', 'out'));
%     
%     %Connect layers to form NN
%     lgraph = connectLayers(lgraph,'Input Layer','Hidden Layer 1');
% %     lgraph = connectLayers(lgraph,'Hidden Layer 1','tanh1');
%     
%     lgraph = connectLayers(lgraph,'Hidden Layer 1','Hidden Layer 2');
% %     lgraph = connectLayers(lgraph,'Hidden Layer 1','Hidden Layer 2 subnet 2');
%     
% %     lgraph = connectLayers(lgraph,'Hidden Layer 2 subnet 1', 'tanh2 subnet1');
% %     lgraph = connectLayers(lgraph,'Hidden Layer 2 subnet 2', 'tanh2 subnet2');
%     
%     lgraph = connectLayers(lgraph, 'Hidden Layer 2', 'multiply/in1');
%     lgraph = connectLayers(lgraph, 'Hidden Layer 2', 'multiply/in2');
%     lgraph = connectLayers(lgraph, 'Hidden Layer 2', 'multiply/in3');
% %     lgraph = connectLayers(lgraph, 'Hidden Layer 2 subnet 2', 'multiply/in2');
%     
% %     lgraph = connectLayers(lgraph, 'tanh1 subnet1', 'Output 2');
% %     lgraph = connectLayers(lgraph, 'tanh1 subnet2', 'Output 2');
% %     
% %     lgraph = connectLayers(lgraph, 'tanh1 subnet1', 'Output 3');
% %     lgraph = connectLayers(lgraph, 'tanh1 subnet2', 'Output 3');
% 
% %     lgraph = connectLayers(lgraph, 'multiply', 'tanh_multiply');
% %     lgraph = connectLayers(lgraph, 'tanh_multiply', 'Hidden Layer 2');
% %     
% %     lgraph = connectLayers(lgraph, 'Hidden Layer 2', 'tanh 2');
%     lgraph = connectLayers(lgraph,  'multiply', 'Output Layer');
%     lgraph = connectLayers(lgraph, 'Output Layer', 'out');
% %     lgraph = connectLayers(lgraph, 'Output 2', 'sigmoid');
% %     lgraph = connectLayers(lgraph, 'Output 3', 'sigmoid');
%     
% %     lgraph = connectLayers(lgraph, 'sigmoid', 'out');
    
    
    
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