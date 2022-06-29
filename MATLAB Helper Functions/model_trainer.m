function [nn, XTest, YTest, XTrain, YTrain] = model_trainer()
    filename = "training_set_4.xlsx";
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
   
    XTrain = fileTrain(:, 1:2);
    YTrain = fileTrain(:, 4:6);
%     YTrain = categorical(fileTrain(:, 7));

    XTest = fileTest(:, 1:2);
    YTest = fileTest(:, 4:6);
%     YTest = categorical(fileTest(:, 7));
    
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
    nn = train_on_NN_2(XTrain, YTrain);
    
end