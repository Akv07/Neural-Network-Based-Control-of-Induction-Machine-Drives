function [gradients, state, loss] = modelGradients(dlnet, dlX, T1, T2, T3, T4)
    [dlY1, state] = forward(dlnet, dlX, 'Outputs', ["output"]);
%     size(Y2)
%     [~, dly1] = max(extractdata(dlY1));
    
%     dly1 = size(dlY1)
%     dly2 = size(dlY2)
%     t1 = size(T1)
%     disp('Hi');
%     dlY1(:,1)
%     [~, dY1] = max(dlY1);
%     y1 = size(dY1)
%     dlY1 = onehotdecode(dlY1, [1 2 3], 1);
%     y1 = extractdata(dlY1);
%     y2 = T1(:);
%     y = dY1(:);
%     y = [y T1]
%     disp('GG')
%     t1 = size(T1)
%     lossLabels  = crossentropy(dlY1, T1, 'DataFormat', 'C');
    disp('YO');
    lossTimes = (mse(dlY1(1,:), T1') + mse(dlY1(2,:), T2') + mse(dlY1(3, :), T3') + mse(dlY1(4,:), T4'))/4;
    disp('HH');
    
    loss  = 50*lossTimes;
    gradients = dlgradient(loss, dlnet.Learnables);
end