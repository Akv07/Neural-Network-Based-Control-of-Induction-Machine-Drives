function new_X = featureExpandForController(X)
    new_X = X;
    
    %Add wmr*isd, wmr*isq, wmr*phi
    new_X(:,8) = X(:,5).*X(:,3);
    new_X(:,9) = X(:,5).*X(:,4);
    new_X(:,10) = X(:,5).*X(:,6);
    
    new_X(:,11) = 0.01*X(:,3).*(X(:,4)./X(:,6));
    new_X(:,12) = 0.01*X(:,4).*(X(:,4)./X(:,6));
    new_X(:,13) = 0.01*X(:,6).*(X(:,4)./X(:,6));
end