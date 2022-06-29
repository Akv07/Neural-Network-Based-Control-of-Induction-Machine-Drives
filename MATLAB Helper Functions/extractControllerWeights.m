W1 = nn.Layers(2).Weights;
b1 = nn.Layers(2).Bias;
W2 = nn.Layers(3).Weights;
b2 = nn.Layers(3).Bias;

xlswrite("Controller NN Weights\W1.xlsx", W1);
xlswrite("Controller NN Weights\b1.xlsx", b1);

xlswrite("Controller NN Weights\W2.xlsx", W2);
xlswrite("Controller NN Weights\b2.xlsx", b2);
