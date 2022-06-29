function controller_training_set_creater()    
    Vbus = 568;
    train_set_size = 100000;
    
    %Generate valid random values for inputs
    inputs = get_random_input_values_controller(train_set_size);
    
    train_set = zeros(train_set_size, 15);
    for i=1:train_set_size
        train_set(i, 1:9) = inputs(i,:);
        [train_set(i, 10), train_set(i, 11), train_set(i, 12), train_set(i,13)] = controller_training_set_row_creater( train_set(i, 1), train_set(i, 2), train_set(i, 3), train_set(i, 4), train_set(i, 5), train_set(i, 6), train_set(i, 7), train_set(i, 8), train_set(i, 9), Vbus );
    end
    size(train_set)
    
    xlswrite("controller_training_set_15.xlsx", train_set);
end