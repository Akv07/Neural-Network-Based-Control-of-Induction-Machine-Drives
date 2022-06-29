function [Vsd_dash, Vsq_dash, Vsd, Vsq, isd_new, isq_new] = controller_training_set_row_creater(isd_star, isq_star,  isd, isq, wm, phi, phi_diff, Tsys)    
    tau = 0.318e-3;
    
    %Motor Parameters
    r1 = 1.405;
    l1  = 0.005839;
    r2 = 1.395;
    l2 = 0.005839;
    Lm = 0.1722;
    Rs = r1;
    
    M = Lm;
    Lr = l1+Lm;
    Ls = l2+Lm;

    sigma = 1 - ((M*M) / (Lr*Ls));
    sigma_r = (Lr/M) - 1;
    
    G = 1;
    
    %Set Controller Parameters
    K2 = exp(-r1*Tsys/(sigma*Ls));
    K = Tsys/(sigma*Ls);
    K1 = K*Rs;
    K3 = exp(-Tsys/tau);
    
    e1 = isd_star-isd;
    e2 = isq_star-isq;
    
    %Finding Vsd_dash and Vsq_dash
    ycd = (((isd_star - ((K3*e1))) * (1+K1)) - isd) / K;
    ycq = (((isq_star - ((K3*e2))) * (1+K1)) - isq) / K;
    
    Vsd_dash = ycd;
    Vsq_dash = ycq;
    
    imr = phi/Lm;
    Tr = Ls/r2;
    
    wmr = wm + (isq/(Tr*imr));
    Vsd = Vsd_dash + ((1/(G*(1+sigma_r)))*phi_diff) - (sigma*Ls*wmr*isq/G);
    Vsq = Vsq_dash + (phi*wmr/(G*(1+sigma_r))) + (sigma*Ls*wmr*isd/G);
    
    
    %Determine new isd and isq
    isd_new = isd_star - e1*K3;
    isq_new = isq_star - e2*K3;
    
end