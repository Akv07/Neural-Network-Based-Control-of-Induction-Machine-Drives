XTrain = featureExpandForController(XTrain);
y = predict(nn, XTrain);
disp(['Train Set MSE: ', num2str(mean(sqrt((mean((y-YTrain).^2))))) ]);

XTest = featureExpandForController(XTest);
y = predict(nn, XTest);
disp(['Test Set MSE: ', num2str(mean(sqrt((mean((y-YTest).^2))))) ]);