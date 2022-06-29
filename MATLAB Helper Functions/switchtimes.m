function [swseq] = switchtimes(Vref, angle, Vbus)    
     numzones = 5;
    %     Method 2 
    Ts = 1e-4;
    m = (2/sqrt(3))*(Vref/Vbus);
    theta = rem(angle, (pi/3));
    
    
    
        n2 = Vref*cos( theta );
        n1 = Vref*cos( (pi/3) - theta );

        T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2));
        T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2);
        T0 = Ts-(T1+T2);
        
    %Switching times calculation of different vectors
%     if m <= 1                % Linear modulation (Overmodulation mode 0)
%         n2 = Vref*cos( theta );
%         n1 = Vref*cos( (pi/3) - theta );
% 
%         T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2));
%         T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2);
%         T0 = Ts-(T1+T2);
%     
%     elseif m<=1.05      % Overmodulation mode I
%         alpha_t = (pi/6) - acos(1/m);
%         if theta > alpha_t && theta < (pi/3) - alpha_t
%             T1 = (sin( (pi/3) - theta ) / ( sin( (pi/3) - theta ) + sin( theta ) ) ) * Ts;
%             T2 = Ts-T1;
%             T0=0;
%         else
%             n2 = Vref*cos( theta );
%             n1 = Vref*cos( (pi/3) - theta );
%             T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2));
%             T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2);
%             T0 = Ts-(T1+T2);
%         end
%         
%     elseif m <= 1.10    % Overmodulation mode II
%         alpha_h = (pi/6) - acos(1/m);
%         if theta <= alpha_h
%             T1 = Ts;
%             T2=0;
%             T0=0;
%             
%         elseif theta > alpha_h && theta < (pi/3) - alpha_h
%             T1 = (sin( (pi/3) - theta ) / ( sin( (pi/3) - theta ) + sin( theta ) ) ) * Ts;
%             T2 = Ts-T1;
%             T0=0;
%             
%         else
%             T1 = 0;
%             T2 = Ts;
%             T0 = 0;
%         end
%         
%     else        % Six Step Mode
%         if theta <= (pi/6)
%             T1 = Ts;
%             T2 = 0;
%             T0 = 0;
%         else
%             T1 = 0;
%             T2 = Ts;
%             T0 = 0;
%         end
%         
%     end
%     
%     T1
%     T2
%     T0
    % Switching Sequence Determination
    Q1 = (cos(theta) - (Vref/Vbus)) * T1;
    Q2 = (cos( (pi/3) - theta) - (Vref/Vbus)) * T2;
    Q0 = - (Vref/Vbus)*T0;
    D = sin(theta) * T1;
    
    %Error Functions (Squared) for Different Switching Sequences
    F_0127 = ( (1/3) * ( (0.5*Q0).^2 ) * T0 / (2*Ts) ) + ( (1/3) * ( ( (0.5*Q0).^2 ) + ( 0.5*Q0* ( (0.5*Q0) + Q1 ) ) + ( ( 1* ( (0.5*Q0) + Q1 ) ).^2) ) * (T1/Ts) ) + ( (1/3) * ( ( ( (0.5*Q0) + Q1).^2) - ( ( (0.5*Q0) + Q1) * (0.5*Q0) ) + ( (0.5*Q0).^2 ) ) * (T2/Ts) ) + ( (1/3) * ( (0.5*Q0).^2 ) * ( T0 / (2*Ts) ) ) + ( (1/3) * (D.^2) * ( (T1+T2) / Ts ) );

    F_012 = ( (4/27) * (Q0.^2) * (T0/Ts) ) + ( (4/27) * ( (Q0.^2) + ( Q0*(Q0+Q1) ) + ( (Q0+Q1).^2 ) ) * (T1/Ts) ) + ( (4/27) * ( (Q0+Q1).^2 ) * (T2/Ts) ) + ( (4/27) * (D.^2) * ( (T1+T2) / Ts) );

    F_721 = ( (4/27) * (Q0.^2) * (T0/Ts) ) + ( (4/27) * ( (Q0.^2) + ( Q0*(Q0+Q2) ) + ( (Q0+Q2).^2 ) ) * (T2/Ts) ) + ( (4/27) * ( (Q0+Q2).^2 ) * (T1/Ts) ) + ( (4/27) * (D.^2) * ( (T1+T2) / Ts) );
    
    F_0121 = ( (1/3) * (Q0.^2) * (T0/Ts) ) + ( (1/3) * ( (Q0.^2) + ( Q0*( Q0 + (0.5*Q1) ) ) + ( ( Q0 + (0.5*Q1) ).^2 ) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * ( ( ( Q0 + (0.5*Q1) ).^2 ) - ( ( Q0 + (0.5*Q1) ) * (0.5*Q1) ) + ( (0.5*Q1).^2 ) ) * (T2/Ts) ) + ( (1/3) * ( (0.5*Q1).^2 ) * (T1 / (2*Ts) ) ) + ( (1/3) * ( (0.5*D).^2 ) * ( (T1+T2) / Ts ) );
    
    F_7212 = ( (1/3) * (Q0.^2) * (T0/Ts) ) + ( (1/3) * ( (Q0.^2) + ( Q0*( Q0 + (0.5*Q2) ) ) + ( ( Q0 + (0.5*Q2) ).^2 ) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * ( ( ( Q0 + (0.5*Q2) ).^2 ) - ( ( Q0 + (0.5*Q2) ) * (0.5*Q2) ) + ( (0.5*Q2).^2 ) ) * (T1/Ts) ) + ( (1/3) * ( (0.5*Q2).^2 ) * (T2 / (2*Ts) ) ) + ( (1/3) * ( (0.5*D).^2 ) * ( (T1+T2) / Ts ) );

    F_1012 = ( (1/3) * ( ( 0.5*Q1).^2 ) * (T1 / (2*Ts) ) ) + ( (1/3) * ( ( (0.5*Q1).^2 ) + ( 0.5*Q1*( (0.5*Q1) + Q0 ) ) + ( ( (0.5*Q1) + Q0 ).^2 ) ) * (T0/Ts) ) + ( (1/3) * ( ( ( (0.5*Q1) + Q0 ).^2 ) - ( ( (0.5*Q1) + Q0 )*Q2 ) + (Q2.^2) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * (Q2.^2) * (T2/Ts) ) + ( (1/3) * ( (0.5*D).^2 ) * ( T1 / (2*Ts) ) ) + ( ( (0.5*D).^2 ) * (T0/Ts) ) + ( (1/3) * ( ( (0.5*D).^2 ) + ( (0.5*D) * D ) + (D.^2) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * (D.^2) * (T2/Ts) );
    
    F_2721 = ( (1/3) * ( ( 0.5*Q2).^2 ) * (T2 / (2*Ts) ) ) + ( (1/3) * ( ( (0.5*Q2).^2 ) + ( 0.5*Q2*( (0.5*Q2) + Q0 ) ) + ( ( (0.5*Q2) + Q0 ).^2 ) ) * (T0/Ts) ) + ( (1/3) * ( ( ( (0.5*Q2) + Q0 ).^2 ) - ( ( (0.5*Q2) + Q0 )*Q1 ) + (Q1.^2) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * (Q1.^2) * (T1/Ts) ) + ( (1/3) * ( (0.5*D).^2 ) * ( T2 / (2*Ts) ) ) + ( ( (0.5*D).^2 ) * (T0/Ts) ) + ( (1/3) * ( ( (0.5*D).^2 ) + ( (0.5*D) * D ) + (D.^2) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * (D.^2) * (T1/Ts) );
    
      if numzones == 3
            %For Three Zone Hybrid PWM
            F = [F_0127, F_0121, F_7212];
            
        elseif numzones == 5
            %For Five Zone Hybrid PWM
            F = [F_0127, F_0121, F_7212, F_1012, F_2721];
        
        elseif numzones == 7
            %For Seven Zone Hybrid PWM
            F = [F_0127, F_0121, F_7212, F_1012, F_2721, F_012, F_721];
            
        end
        
        [~, idx] = min(F);

        if idx == 1
            switchseq = "0127";
        elseif idx == 2
            switchseq = "0121";
        elseif idx == 3
            switchseq = "7212";
        elseif idx == 4
            switchseq = "1012";
        elseif idx == 5
            switchseq = "2721";
        elseif idx == 6
            switchseq = "012";
        elseif idx == 7
            switchseq = "721";
        end
    
     
    if switchseq == "0127"
        swseq = 1;
    elseif switchseq == "0121"
        swseq = 2;
    elseif switchseq == "7212"
        swseq = 3;
    elseif switchseq == "1012"
        swseq = 4;
    elseif switchseq == "2721"
        swseq = 5;
    elseif switchseq == "012"
        swseq = 6;
    elseif switchseq == "721"
        swseq = 7;
    end
end