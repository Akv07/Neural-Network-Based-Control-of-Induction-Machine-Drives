c = 'r';

W1_subnet1 = nn.Layers(2).Weights;
b1_subnet1 = nn.Layers(2).Bias;
W1_subnet2 = nn.Layers(4).Weights;
b1_subnet2 = nn.Layers(4).Bias;

W2 = nn.Layers(8).Weights;
b2 = nn.Layers(8).Bias;

if c=='c'
    xlswrite("Classification Weights\W1_subnet1_tmp.xlsx", W1_subnet1);
    xlswrite("Classification Weights\b1_subnet1_tmp.xlsx", b1_subnet1);
    xlswrite("Classification Weights\W1_subnet2_tmp.xlsx", W1_subnet2);
    xlswrite("Classification Weights\b1_subnet2_tmp.xlsx", b1_subnet2);
    xlswrite("Classification Weights\W2_subnet_tmp.xlsx", W2);
    xlswrite("Classification Weights\b2_subnet_tmp.xlsx", b2);

    % xlswrite("Classification Weights\W3_subnet_tmp.xlsx", W3);
    % xlswrite("Classification Weights\b3_subnet_tmp.xlsx", b3);
else
    xlswrite("Regression Weights\W1_subnet1_tmp_odd_90.xlsx", W1_subnet1);
    xlswrite("Regression Weights\b1_subnet1_tmp_odd_90.xlsx", b1_subnet1);
    xlswrite("Regression Weights\W1_subnet2_tmp_odd_90.xlsx", W1_subnet2);
    xlswrite("Regression Weights\b1_subnet2_tmp_odd_90.xlsx", b1_subnet2);
    xlswrite("Regression Weights\W2_subnet_tmp_odd_90.xlsx", W2);
    xlswrite("Regression Weights\b2_subnet_tmp_odd_90.xlsx", b2);

    % xlswrite("Regression Weights\W3_subnet_tmp.xlsx", W3);
    % xlswrite("Regression Weights\b3_subnet_tmp.xlsx", b3);
end