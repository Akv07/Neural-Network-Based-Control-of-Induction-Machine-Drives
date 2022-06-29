c='r';

if c == 'c'
        XTrain = featureExpand(XTrain);
        y = predict(nn, XTrain);
        [~, y] = max(y, [], 2);
        y = categorical(y);
        disp(['Train Set Accuracy: ', num2str(100*mean(y==YTrain)), ' %']);
        
        XTest = featureExpand(XTest);
        y = predict(nn, XTest);
        [~, y] = max(y, [], 2);
        y = categorical(y);
        disp(['Test Set Accuracy: ', num2str(100*mean(y==YTest)), ' %']);
        
elseif c == 'r'
        XTrain = featureExpand(XTrain);
        y = predict(nn, XTrain);
        disp(['Train Set MSE: ', num2str(mean(sqrt((mean((y-YTrain).^2))))) ]);
        
        XTest = featureExpand(XTest);
        y = predict(nn, XTest);
        disp(['Test Set MSE: ', num2str(mean(sqrt((mean((y-YTest).^2))))) ]);
        
end