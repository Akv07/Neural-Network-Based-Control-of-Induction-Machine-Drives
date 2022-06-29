function train_set =  training_set_creator()
    Vbus = 800;
    train_set_size = 100000;
    
    %Generate random numbers inside hexagon to get random values of Vref
    %and angle
    Vref_angle = get_random_Vref_angle(train_set_size, Vbus);
    
%     train_set = create_training_set_row( (Vref_angle(:, 1)/Vbus * 2/sqrt(3)), Vref_angle(:, 2) );
    
    train_set = zeros(train_set_size, 7);
    for i=1:train_set_size
        train_set(i, 1) = (Vref_angle(i, 1)/Vbus) * (2/sqrt(3));
        train_set(i, 2) = Vref_angle(i, 2);
        [train_set(i,3), train_set(i, 4), train_set(i, 5), train_set(i, 6), train_set(i, 7)] = create_training_set_row( train_set(i, 1), Vref_angle(i, 2) );
    end
    size(train_set)
    
    xlswrite("training_set_4.xlsx", train_set);
end