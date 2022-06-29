function Vref_angle = get_random_Vref_angle(train_set_size, Vbus)    
    %Generate random numbers inside hexagon to get random values of Vref
    %and angle
    xy = generate_random_xy_in_circle(train_set_size, Vbus);
    [angle, Vref] = cart2pol(xy(:, 1), xy(:, 2));
    angle(angle<0) = angle(angle<0) + (2*pi);
    Vref_angle = [Vref, angle];
end