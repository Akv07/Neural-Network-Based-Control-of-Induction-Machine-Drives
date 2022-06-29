function inputs = get_random_input_values_controller(train_set_size)
    inputs = rand(train_set_size, 9)*100;
%     inputs(:,7) = inputs(:,7)*2;
end