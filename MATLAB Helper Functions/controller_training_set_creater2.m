function controller_training_set_creater2()    
    Vbus = 568;
    train_set_size = 100000;
    Tsys = 100e-6;
    
    isd_lim = 7;
    isq_lim = 23;
    phi_lim = 1.2;
    
    %Number of Samples for Each Reference Pair
    tau = 0.318e-3;
    num_time_const = 5*10;
    sample_per_ref = int32(num_time_const * tau / Tsys) %200 %Number of samples for each pair of references %%%% 
    
    num_sample_ref = int32(train_set_size / sample_per_ref )%Number of reference pairs taken
    
    train_set = zeros(train_set_size, 11);
    
    for i=1:num_sample_ref
        %Generate valid random values for references
        ref = rand(1,2);
        ref(1,1) = ref(1,1)*isd_lim*1.3;
        ref(1,2) = ref(1,2)*isq_lim*1.3;
        
%         Tsys = rand(1,1)*1e-3;
        
        isd_star = ref(1,1);
        isq_star = ref(1,2);
        isd = 0;
        isq = 0;
        
        %Run Sequentially for getting isd,isq
        %Assuming random values of phi, w, d_phi/dt
        for j=1:sample_per_ref
            decoupling = rand(1,3);
            decoupling(1,1) = decoupling(1,1)*200; %Speed Limit = 200 rad/s
            decoupling(1,2) = decoupling(1,2)*phi_lim*1.2;
            decoupling(1,3) = decoupling(1,3)*100;
            
            idx = ((i-1)*sample_per_ref) + j;
            
            train_set(idx, 1:4) = [isd_star, isq_star, isd, isq];
            train_set(idx, 5:7) = decoupling;
%             train_set(idx, 8) = Tsys;
            
            [train_set(idx, 8), train_set(idx, 9), train_set(idx, 10), train_set(idx,11), isd, isq] = controller_training_set_row_creater( train_set(idx, 1), train_set(idx, 2), train_set(idx, 3), train_set(idx, 4), train_set(idx, 5), train_set(idx, 6), train_set(idx, 7), Tsys);
            
        end
        
end
    
    size(train_set)
    
    xlswrite("controller_training_set_27.xlsx", train_set);
end