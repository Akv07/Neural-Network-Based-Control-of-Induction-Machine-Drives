function T0 = calcTimes(Vref, theta, Ts, sector, Vbus)
    n2 = Vref*cos(theta);
    n1 = Vref*cos((pi/3)-theta);
    
%     T1 = sqrt(3)*Ts*Vref*(sin(sector*pi/3)*cos(angle - ((sector-1)*pi/3)) - cos(sector*pi/3)*sin(angle - ((sector-1)*pi/3)))/u(3);
%     T2 = sqrt(3)*Ts*Vref*(-cos(angle - ((sector-1)*pi/3))*sin((sector-1)*pi/3) + sin(angle - ((sector-1)*pi/3))*cos((sector-1)*pi/3))/u(3);
    
    T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2))
    T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2)
    T0 = Ts-(T1+T2)
    
    ans = (sin(theta)*T1) - (sin((pi/3)-theta)*T2);

end