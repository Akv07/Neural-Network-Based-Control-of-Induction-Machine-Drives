function [nn, XTest, YTest, XTrain, YTrain] = model_trainer_controller()
    filename = "controller_training_set_27.xlsx";
%     range = 'A2:G100002';
    
    file = readmatrix(filename);
%     file = readmatrix(filename);
    
%     %Normalize input data
%     file(:,1) = file(:,1) ./ (2/sqrt(3));
%     file(:, 2) = file(:, 2) ./ (2*pi);
    
    
    [m,n] = size(file);
    P = 0.80;
    idx = randperm(m);
   fileTrain = file(idx(1:round(P*m)), :);
   fileTest = file(idx(round(P*m)+1:end), :);
   
    XTrain = fileTrain(:, 1:7);
%     YTrain = fileTrain(:, 10:15);
    YTrain = fileTrain(:, 10:11);

    XTest = fileTest(:, 1:7);
%     YTest = fileTest(:, 10:15);
    YTest = fileTest(:, 10:11);
    
    %Regression Models
%     linmdl = fitrsvm(XTrain, YTrain, 'Standardize', true);
%     polymdl = fitrsvm(XTrain, YTrain, 'Standardize', true, 'KernelFunction', 'polynomial', 'PolynomialOrder', 3);
%     gaumdl = fitrsvm(XTrain, YTrain, 'Standardize', true, 'KernelFunction', 'gaussian');
%     gprmdl = fitrgp(XTrain, YTrain);


    %Classification Models
%     t = templateSVM('KernelFunction','gaussian');
%     svmmdl = fitcecoc(XTrain, YTrain, 'Learners', t);
%     cnbmdl = fitcnb(XTrain, YTrain, 'OptimizeHyperparameters','auto');
%     test_on_NN(dlnet, XTest, YTest);

    %NN Models
    nn = train_on_NN_for_controller(XTrain, YTrain);
    
end