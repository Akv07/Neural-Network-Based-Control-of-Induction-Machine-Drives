function [T1, T2, T0, sector, swseq] = create_training_row(Vref, angle, Ts, Vbus, Tsys)    
    %     Method 2 
    m = (2/sqrt(3))*(Vref/Vbus);
    theta = rem(angle, (pi/3));
    
    %Switching times calculation of different vectors
    if m <= 1                % Linear modulation (Overmodulation mode 0)
        n2 = Vref*cos( theta );
        n1 = Vref*cos( (pi/3) - theta );

        T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2));
        T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2);
        T0 = Ts-(T1+T2);
    
    elseif m<=1.05      % Overmodulation mode I
        alpha_t = (pi/6) - acos(1/m);
        if theta > alpha_t && theta < (pi/3) - alpha_t
            T1 = (sin( (pi/3) - theta ) / ( sin( (pi/3) - theta ) + sin( theta ) ) ) * Ts;
            T2 = Ts-T1;
            T0=0;
        else
            n2 = Vref*cos( theta );
            n1 = Vref*cos( (pi/3) - theta );
            T1 = (2*Ts/(3*Vbus)) * ((-n1) + (2*n2));
            T2 = (2*Ts/(3*Vbus)) * ((2*n1) - n2);
            T0 = Ts-(T1+T2);
        end
        
    elseif m <= 1.10    % Overmodulation mode II
        alpha_h = (pi/6) - acos(1/m);
        if theta <= alpha_h
            T1 = Ts;
            T2=0;
            T0=0;
            
        elseif theta > alpha_h && theta < (pi/3) - alpha_h
            T1 = (sin( (pi/3) - theta ) / ( sin( (pi/3) - theta ) + sin( theta ) ) ) * Ts;
            T2 = Ts-T1;
            T0=0;
            
        else
            T1 = 0;
            T2 = Ts;
            T0 = 0;
        end
        
    else        % Six Step Mode
        if theta <= (pi/6)
            T1 = Ts;
            T2 = 0;
            T0 = 0;
        else
            T1 = 0;
            T2 = Ts;
            T0 = 0;
        end
        
    end
    
    % Switching Sequence Determination
    Q1 = (cos(theta) - (Vref/Vbus)) * T1;
    Q2 = (cos( (pi/3) - theta) - (Vref/Vbus)) * T2;
    Q0 = - (Vref/Vbus)*T0;
    D = sin(theta) * T1;
    
    %Error Functions (Squared) for Different Switching Sequences
    F_0127 = ( (1/3) * ( (0.5*Q0).^2 ) * T0 / (2*Ts) ) + ( (1/3) * ( ( (0.5*Q0).^2 ) + ( 0.5*Q0* ( (0.5*Q0) + Q1 ) ) + ( ( 0.5*Q0* ( (0.5*Q0) + Q1 ) ).^2) ) * (T1/Ts) ) + ( (1/3) * ( ( ( (0.5*Q0) + Q1).^2) - ( ( (0.5*Q0) + Q1) * (0.5*Q0) ) + ( (0.5*Q0).^2 ) ) * (T2/Ts) ) + ( (1/3) * ( (0.5*Q0).^2 ) * ( T0 / (2*Ts) ) ) + ( (1/3) * (D.^2) * ( (T1+T2) / Ts ) );
    
    F_012 = ( (4/27) * (Q0.^2) * (T0/Ts) ) + ( (4/27) * ( (Q0.^2) + ( Q0*(Q0+Q1) ) + ( (Q0+Q1).^2 ) ) * (T1/Ts) ) + ( (4/27) * ( (Q0+Q1).^2 ) * (T2/Ts) ) + ( (4/27) * (D.^2) * ( (T1+T2) / Ts) );

    F_721 = ( (4/27) * (Q0.^2) * (T0/Ts) ) + ( (4/27) * ( (Q0.^2) + ( Q0*(Q0+Q2) ) + ( (Q0+Q2).^2 ) ) * (T2/Ts) ) + ( (4/27) * ( (Q0+Q2).^2 ) * (T1/Ts) ) + ( (4/27) * (D.^2) * ( (T1+T2) / Ts) );
    
    F_0121 = ( (1/3) * (Q0.^2) * (T0/Ts) ) + ( (1/3) * ( (Q0.^2) + ( Q0*( Q0 + (0.5*Q1) ) ) + ( ( Q0 + (0.5*Q1) ).^2 ) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * ( ( ( Q0 + (0.5*Q1) ).^2 ) - ( ( Q0 + (0.5*Q1) ) * (0.5*Q1) ) + ( (0.5*Q1).^2 ) ) * (T2/Ts) ) + ( (1/3) * ( (0.5*Q1).^2 ) * (T1 / (2*Ts) ) ) + ( (1/3) * ( (0.5*D).^2 ) * ( (T1+T2) / Ts ) );
    
    F_7212 = ( (1/3) * (Q0.^2) * (T0/Ts) ) + ( (1/3) * ( (Q0.^2) + ( Q0*( Q0 + (0.5*Q2) ) ) + ( ( Q0 + (0.5*Q2) ).^2 ) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * ( ( ( Q0 + (0.5*Q2) ).^2 ) - ( ( Q0 + (0.5*Q2) ) * (0.5*Q2) ) + ( (0.5*Q2).^2 ) ) * (T1/Ts) ) + ( (1/3) * ( (0.5*Q2).^2 ) * (T2 / (2*Ts) ) ) + ( (1/3) * ( (0.5*D).^2 ) * ( (T1+T2) / Ts ) );

    F_1012 = ( (1/3) * ( ( 0.5*Q1).^2 ) * (T1 / (2*Ts) ) ) + ( (1/3) * ( ( (0.5*Q1).^2 ) + ( 0.5*Q1*( (0.5*Q1) + Q0 ) ) + ( ( (0.5*Q1) + Q0 ).^2 ) ) * (T0/Ts) ) + ( (1/3) * ( ( ( (0.5*Q1) + Q0 ).^2 ) - ( ( (0.5*Q1) + Q0 )*Q2 ) + (Q2.^2) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * (Q2.^2) * (T2/Ts) ) + ( (1/3) * ( (0.5*D).^2 ) * ( T1 / (2*Ts) ) ) + ( ( (0.5*D).^2 ) * (T0/Ts) ) + ( (1/3) * ( ( (0.5*D).^2 ) + ( (0.5*D) * D ) + (D.^2) ) * ( T1 / (2*Ts) ) ) + ( (1/3) * (D.^2) * (T2/Ts) );
    
    F_2721 = ( (1/3) * ( ( 0.5*Q2).^2 ) * (T2 / (2*Ts) ) ) + ( (1/3) * ( ( (0.5*Q2).^2 ) + ( 0.5*Q2*( (0.5*Q2) + Q0 ) ) + ( ( (0.5*Q2) + Q0 ).^2 ) ) * (T0/Ts) ) + ( (1/3) * ( ( ( (0.5*Q2) + Q0 ).^2 ) - ( ( (0.5*Q2) + Q0 )*Q1 ) + (Q1.^2) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * (Q1.^2) * (T1/Ts) ) + ( (1/3) * ( (0.5*D).^2 ) * ( T2 / (2*Ts) ) ) + ( ( (0.5*D).^2 ) * (T0/Ts) ) + ( (1/3) * ( ( (0.5*D).^2 ) + ( (0.5*D) * D ) + (D.^2) ) * ( T2 / (2*Ts) ) ) + ( (1/3) * (D.^2) * (T1/Ts) );
    
    %For Three Zone Hybrid PWM
    F = [F_0127, F_0121, F_7212];
    [~, idx] = min(F);
    
    if idx == 1
        switchseq = "0127";
    elseif idx == 2
        switchseq = "0121";
    else
        switchseq = "7212";
    end
    
    % Switching Times calculation of switches
    Vsamp = Vref*exp(1i*angle);
    T = 1:1:(Ts/Tsys);
    
    Gmax = zeros(1, int32(Ts/Tsys));
    Gmed = zeros(1, int32(Ts/Tsys));
    Glow = zeros(1, int32(Ts/Tsys));
    
    if switchseq == "0127"
        for i = int32(1+((T0/4)/Tsys)) : 1 : int32( (((T0/4) + (T1/2)) / Tsys) )
            Gmax(i) = 1;
            Gmax((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+(((T0/4) + (T1/2)) / Tsys)) : 1 : int32((((T0/4) + (T1/2) + (T2/2)) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+ (((T0/4) + (T1/2) + (T2/2)) / Tsys)) : 1 :  int32((((T0/4) + (T1/2) + (T2/2) + (T0/4)) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            Glow(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
            Glow((Ts/Tsys)+1-i) = 1;
        end
        
    elseif switchseq == "0121"
        for i = int32(1+((T0/2)/Tsys)) : 1 : int32((((T0/2) + (T1/4)) / Tsys))
            Gmax(i) = 1;
            Gmax((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+(((T0/2) + (T1/4)) / Tsys)) : 1 : int32((((T0/2) + (T1/4) + (T2/2)) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+ (((T0/2) + (T1/4) + (T2/2)) / Tsys)) : 1 :  int32((((T0/2) + (T1/4) + (T2/2) + (T1/4)) / Tsys))
            Gmax(i) = 1;
            Gmax((Ts/Tsys)+1-i) = 1;
        end
        
    elseif switchseq == "7212"
        for i = 1 : 1 :  int32(((T0/2) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            Glow(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
            Glow((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+((T0/2)/Tsys)) : 1 : int32((((T0/2) + (T2/4)) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+(((T0/2) + (T2/4)) / Tsys)) : 1 : int32((((T0/2) + (T2/4) + (T1/2)) / Tsys))
            Gmax(i) = 1;
            Gmax((Ts/Tsys)+1-i) = 1;
        end
        
        for i = int32(1+ (((T0/2) + (T2/4) + (T1/2)) / Tsys)) : 1 :  int32((((T0/2) + (T2/4) + (T1/2) + (T2/4)) / Tsys))
            Gmax(i) = 1;
            Gmed(i) = 1;
            
            Gmax((Ts/Tsys)+1-i) = 1;
            Gmed((Ts/Tsys)+1-i) = 1;
        end
            
    end
    
    timings = zeros(6, 3, int32(Ts/Tsys));
    timings(1, :, :) = [Gmax;     Gmed;     Glow ];
    timings(2, :, :) = [Gmed;     Gmax;     Glow ];
    timings(3, :, :) = [Glow ;     Gmax;     Gmed];
    timings(4, :, :) = [Glow ;     Gmed;     Gmax];
    timings(5, :, :) = [Gmed;     Glow ;     Gmax];
    timings(6, :, :) = [Gmax;     Glow ;     Gmed];
    
    V1 = Vbus*exp(1i*0);
    V2 = Vbus*exp(1i*(pi/3));
    V3 = Vbus*exp(1i*(2*pi/3));
    V4 = Vbus*exp(1i*(3*pi/3));
    V5 = Vbus*exp(1i*(4*pi/3));
    V6 = Vbus*exp(1i*(5*pi/3));

    V = [V1; V2; V3; V4; V5; V6];
    V = V - Vsamp;
    [~, minVidx] = mink(V, 2);

%         minVidx = minVidx(:, 1);

    if max(minVidx) == 6 && min(minVidx) == 1
        minVidx = 6;
    else
        minVidx = min(minVidx);
    end
    answ = squeeze(real(timings(minVidx, :, :)));
    size(answ)
    
    S1 = answ(1, :);
    S1 = S1(:);
    S3 = answ(2, :);
    S3 = S3(:);
    S5 = answ(3, :);
    S5 = S5(:);
    sector = minVidx;
    
    if switchseq == "0127"
        swseq = 1;
    elseif switchseq == "0121"
        swseq = 2;
    else
        swseq = 3;
    end
end