function [phi_d_samp, phi_q_samp, sector] = calc_flux_error(time, Ts, Tsys)
[frat, Vref, Vbus, IL, Ts, Tsys] = motor_calc();

theta = rem(2*pi*frat*time, pi/3);
sector = int8(rem(((2*pi*frat*time/ (pi/3))), 6))+1;
m = (2/sqrt(3)) * Vref/Vbus;
T1 = m*sin((pi/3)-theta)*Ts;
T2 = m*sin(theta)*Ts;
T0 = Ts-(T1+T2);

% phi_d_samp = 0;
% phi_q_samp = 0;

for i = 1 : Ts/Tsys
    t = Tsys*i;
    
    if t <= (T0/4)
        phi_d_samp(i) = 0;
        phi_q_samp(i) = -Vref*t;
        
    elseif t <= ((T0/4) + (T1/2))
        phi_d_samp(i) = Vbus*sin(theta)*(t - (T0/4));
        phi_q_samp(i) = (Vbus*cos(theta)*(t-(T0/4))) - (Vref*t);
        
    elseif t <= ((Ts/2) - (T0/4))
        phi_d_samp(i) = (Vbus*sin(theta)*T1/2) - (Vbus*sin((pi/3) - theta)*(t - ( (T0/4) + (T1/2) ) ));
        phi_q_samp(i) = (Vbus*cos(theta)*(T1/2)) + (Vbus*cos((pi/3) - theta)*(t - ( (T0/4) + (T1/2) ) ) ) + (-Vref*t);
        
    elseif t <= ((Ts/2) + (T0/4))
        phi_d_samp(i) = 0;
        phi_q_samp(i) = (Vbus*cos(theta)*(T1/2)) + (Vbus*cos((pi/3) - theta)*(T2/2)) + (-Vref*t);
        
    elseif t <= ((Ts/2) + (T0/4) + (T2/2))
        phi_d_samp(i) = -Vbus*sin((pi/3) - theta)*(t - ( (Ts/2) + (T0/4) ) );
        phi_q_samp(i) = (Vbus*cos(theta)*(T1/2)) + (Vbus*cos((pi/3) - theta)*(T2/2)) + (Vbus*cos((pi/3) - theta)*(t - ( (Ts/2) + (T0/4) ) ) ) +(-Vref*t);
        
    elseif t <= (Ts - (T0/4) )
        phi_d_samp(i) = (Vbus*sin(theta)*(t - ( (Ts/2) + (T0/4) + (T2/2) ) ) ) - (Vbus*sin((pi/3) - theta)*(T2/2)); 
        phi_q_samp(i) = (Vbus*cos(theta)*(T1/2)) + (Vbus*cos((pi/3) - theta)*T2) + (Vbus*cos(theta)*(t - ( (Ts/2) + (T0/4) + (T2/2) ) ) ) + (-Vref*t);
        
    else
        phi_d_samp(i) = 0;
        phi_q_samp(i) = (Vbus*cos(theta)*T1) + (Vbus*cos((pi/3) - theta)*T2) + (-Vref*t);
        
    end
end

end