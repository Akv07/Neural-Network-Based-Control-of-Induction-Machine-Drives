function [phi_d_rms, phi_q_rms] = calc_error(time)
[frat, Vref, Vbus, IL, Ts, Tsys] = motor_calc();

theta = rem(2*pi*frat*time, pi/3);
sector = floor(rem(((2*pi*frat*time/ (pi/3))), 6))+1
m = (2/sqrt(3)) * Vref/Vbus;
T1 = m*sin((pi/3)-theta)*Ts;
T2 = m*sin(theta)*Ts;
T0 = Ts-(T1+T2);

    [phi_d, phi_q] = calc_flux_error(time, Ts, Tsys);
    
    phi_d_pp = (Vbus*sin((pi/3) - theta)*T2/2 ) + (Vbus*sin(theta)*T1/2 )
%     phi_q_pp = Vref*T0/2
    
%     phi_d_pp = max(phi_d) - min(phi_d)
    phi_q_pp = max(phi_q) - min(phi_q)
    
    phi_d_rms1 = sqrt(sum(phi_d.^2)*Tsys/Ts);
    phi_q_rms1 = sqrt(sum(phi_q.^2)*Tsys/Ts);
    
    phi_d_rms = T1*T1*T1*sin(theta)*sin(theta);
    phi_d_rms = phi_d_rms + (3*T1*T1*T2*sin(theta)*sin(theta));
    phi_d_rms = phi_d_rms - (3*T1*T2*T2*sin(theta)*sin((pi/3)-theta));
    phi_d_rms = phi_d_rms + (T2*T2*T2*sin((pi/3)-theta)*sin((pi/3)-theta));
    phi_d_rms = sqrt((Vbus*Vbus/(12*Ts)) * phi_d_rms);
    
    phi_q_rms = Vref*Vref*Ts*Ts*Ts/24;
    phi_q_rms = phi_q_rms + (Vbus*Vbus*cos(theta)*cos(theta)*T1*T1*((T0/2)+(T1/3)+T2)/8);
    phi_q_rms = phi_q_rms + (Vbus*Vbus*cos((pi/3)-theta)*cos((pi/3)-theta)*T2*T2*((T0/2)+(T2/3))/8);
    phi_q_rms = phi_q_rms + (Vbus*Vbus*cos((pi/3)-theta)*cos(theta)*T1*T2*(T0+T2)/8);
    phi_q_rms = phi_q_rms - (Vbus*Vref*cos(theta)*( (2*T1*T1*T1/3) + (2*T0*T1*T2) + (2*T1*T1*T2) + (T1*T2*T2) + (3*T0*T0*T1/4)  + (3*T0*T1*T1/2) )/8);
    phi_q_rms = phi_q_rms - (Vbus*Vref*cos((pi/3)-theta)*( (2*T2*T2*T2/3) + (3*T0*T2*T2/2) + (T1*T2*T2) + (3*T0*T0*T2/4) + (T0*T1*T2) )/8);
    phi_q_rms = sqrt((2/Ts)*phi_q_rms);
    
    %Length of generated vector
    l = ((Vbus*(T1)) + (Vbus*(0.5 + (1i*sqrt(3)/2))*T2))/Ts;
    length = abs(l);
    ang = angle(l);
    
end