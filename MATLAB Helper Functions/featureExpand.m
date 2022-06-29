function new_X = featureExpand(X)
    new_X = X;
    
%     new_X(:, 3) = sin(X(:, 2));
%     new_X(:, 4) = cos(X(:, 2));
%     
%     new_X(:, 5) = sin(rem(X(:, 2), pi/3));
%     new_X(:, 6) = cos(rem(X(:, 2), pi/3));
%     new_X(:, 7) = sin(pi/3 - rem(X(:, 2), pi/3));
%     new_X(:, 8) = cos(pi/3 - rem(X(:, 2), pi/3));
%     
%     new_X(:, 9) = X(:, 1).*sin(X(:, 2));
%     new_X(:, 10) = X(:, 1).*cos(X(:, 2));
%     new_X(:, 11) = X(:, 1).*sin(rem(X(:, 2), pi/3));
%     new_X(:, 12) = X(:, 1).*cos(rem(X(:, 2), pi/3));
%     new_X(:, 13) = X(:, 1).*sin(pi/3 - rem(X(:, 2), pi/3));
%     new_X(:, 14) = X(:, 1).*cos(pi/3 - rem(X(:, 2), pi/3));
%     
%     new_X(:, 15) = sin(2*X(:, 2));
%     new_X(:, 16) = cos(2*X(:, 2));
%     
%     new_X(:, 17) = sin(3*X(:, 2));
%     new_X(:, 18) = cos(3*X(:, 2));
%     
%     new_X(:, 19) = sin(4*X(:, 2));
%     new_X(:, 20) = cos(4*X(:, 2));
    %Include sinusoidal terms (1st order)
    new_X(:, 3) = sin(X(:, 1));
    new_X(:, 4) = sin(X(:, 2));
    new_X(:, 5) = cos(X(:, 1));
    new_X(:, 6) = cos(X(:, 2));
    
%     %Include 2nd harmonic sinusoidal terms
%     new_X(:, 7) = sin(2*X(:, 1));
%     new_X(:, 8) = sin(2*X(:, 2));
%     new_X(:, 9) = cos(2*X(:, 1));
%     new_X(:, 10) = cos(2*X(:, 2));
    
    %Include 3rd harmonic sinusoidal terms
    new_X(:, 7) = sin(3*X(:, 1));
    new_X(:, 8) = sin(3*X(:, 2));
    new_X(:, 9) = cos(3*X(:, 1));
    new_X(:, 10) = cos(3*X(:, 2));
% %     
% %     %Include 4th harmonic sinusoidal terms
% %     new_X(:, 15) = sin(4*X(:, 1));
% %     new_X(:, 16) = sin(4*X(:, 2));
% %     new_X(:, 17) = cos(4*X(:, 1));
% %     new_X(:, 18) = cos(4*X(:, 2));
%Include 5th harmonic sinusoidal terms
    new_X(:, 11) = sin(5*X(:, 1));
    new_X(:, 12) = sin(5*X(:, 2));
    new_X(:, 13) = cos(5*X(:, 1));
    new_X(:, 14) = cos(5*X(:, 2));
%Include 7th harmonic sinusoidal terms
    new_X(:, 15) = sin(7*X(:, 1));
    new_X(:, 16) = sin(7*X(:, 2));
    new_X(:, 17) = cos(7*X(:, 1));
    new_X(:, 18) = cos(7*X(:, 2));
%Include 9th harmonic sinusoidal terms
    new_X(:, 19) = sin(9*X(:, 1));
    new_X(:, 20) = sin(9*X(:, 2));
    new_X(:, 21) = cos(9*X(:, 1));
    new_X(:, 22) = cos(9*X(:, 2));
%Include 11th harmonic sinusoidal terms
    new_X(:, 23) = sin(11*X(:, 1));
    new_X(:, 24) = sin(11*X(:, 2));
    new_X(:, 25) = cos(11*X(:, 1));
    new_X(:, 26) = cos(11*X(:, 2));
    
%Include 13th harmonic sinusoidal terms
    new_X(:, 27) = sin(13*X(:, 1));
    new_X(:, 28) = sin(13*X(:, 2));
    new_X(:, 29) = cos(13*X(:, 1));
    new_X(:, 30) = cos(13*X(:, 2));
    
%Include 15th harmonic sinusoidal terms
    new_X(:, 31) = sin(15*X(:, 1));
    new_X(:, 32) = sin(15*X(:, 2));
    new_X(:, 33) = cos(15*X(:, 1));
    new_X(:, 34) = cos(15*X(:, 2));
    
%Include 17th harmonic sinusoidal terms
    new_X(:, 35) = sin(17*X(:, 1));
    new_X(:, 36) = sin(17*X(:, 2));
    new_X(:, 37) = cos(17*X(:, 1));
    new_X(:, 38) = cos(17*X(:, 2));
    
 %Include 19th harmonic sinusoidal terms
    new_X(:, 39) = sin(19*X(:, 1));
    new_X(:, 40) = sin(19*X(:, 2));
    new_X(:, 41) = cos(19*X(:, 1));
    new_X(:, 42) = cos(19*X(:, 2));
    
%Include 21th harmonic sinusoidal terms
    new_X(:, 43) = sin(21*X(:, 1));
    new_X(:, 44) = sin(21*X(:, 2));
    new_X(:, 45) = cos(21*X(:, 1));
    new_X(:, 46) = cos(21*X(:, 2));
    
%Include 23th harmonic sinusoidal terms
    new_X(:, 47) = sin(23*X(:, 1));
    new_X(:, 48) = sin(23*X(:, 2));
    new_X(:, 49) = cos(23*X(:, 1));
    new_X(:, 50) = cos(23*X(:, 2));

%Include 25th harmonic sinusoidal terms
    new_X(:, 51) = sin(25*X(:, 1));
    new_X(:, 52) = sin(25*X(:, 2));
    new_X(:, 53) = cos(25*X(:, 1));
    new_X(:, 54) = cos(25*X(:, 2));

%Include 27th harmonic sinusoidal terms
    new_X(:, 55) = sin(27*X(:, 1));
    new_X(:, 56) = sin(27*X(:, 2));
    new_X(:, 57) = cos(27*X(:, 1));
    new_X(:, 58) = cos(27*X(:, 2));
    
%Include 29th harmonic sinusoidal terms
    new_X(:, 59) = sin(29*X(:, 1));
    new_X(:, 60) = sin(29*X(:, 2));
    new_X(:, 61) = cos(29*X(:, 1));
    new_X(:, 62) = cos(29*X(:, 2));

%Include 31th harmonic sinusoidal terms
    new_X(:, 63) = sin(31*X(:, 1));
    new_X(:, 64) = sin(31*X(:, 2));
    new_X(:, 65) = cos(31*X(:, 1));
    new_X(:, 66) = cos(31*X(:, 2));

%Include 33th harmonic sinusoidal terms
    new_X(:, 67) = sin(33*X(:, 1));
    new_X(:, 68) = sin(33*X(:, 2));
    new_X(:, 69) = cos(33*X(:, 1));
    new_X(:, 70) = cos(33*X(:, 2));
    
%Include 35th harmonic sinusoidal terms
    new_X(:, 71) = sin(35*X(:, 1));
    new_X(:, 72) = sin(35*X(:, 2));
    new_X(:, 73) = cos(35*X(:, 1));
    new_X(:, 74) = cos(35*X(:, 2));
    
%Include 37th harmonic sinusoidal terms
    new_X(:, 75) = sin(37*X(:, 1));
    new_X(:, 76) = sin(37*X(:, 2));
    new_X(:, 77) = cos(37*X(:, 1));
    new_X(:, 78) = cos(37*X(:, 2));
    
%Include 39th harmonic sinusoidal terms
    new_X(:, 79) = sin(39*X(:, 1));
    new_X(:, 80) = sin(39*X(:, 2));
    new_X(:, 81) = cos(39*X(:, 1));
    new_X(:, 82) = cos(39*X(:, 2));
    
%Include 41th harmonic sinusoidal terms
    new_X(:, 83) = sin(41*X(:, 1));
    new_X(:, 84) = sin(41*X(:, 2));
    new_X(:, 85) = cos(41*X(:, 1));
    new_X(:, 86) = cos(41*X(:, 2));

%Include 43th harmonic sinusoidal terms
    new_X(:, 87) = sin(43*X(:, 1));
    new_X(:, 88) = sin(43*X(:, 2));
    new_X(:, 89) = cos(43*X(:, 1));
    new_X(:, 90) = cos(43*X(:, 2));
% %     new_X(:, 7) = sin(X(:, 1).*X(:, 2));
%     new_X(:, 8) = cos(X(:, 1).*X(:, 2));
    
%     %Include 2nd order terms
%     new_X(:, 3) = X(:, 1).*X(:, 1);
%     new_X(:, 4) = X(:, 1).*X(:, 2);
%     new_X(:, 5) = X(:, 2).*X(:, 2);
    
%     %Include 3rd order terms
%     new_X(:, 6) = X(:, 1).*X(:, 1).*X(:, 1);
%     new_X(:, 7) = X(:, 1).*X(:, 1).*X(:, 2);
%     new_X(:, 8) = X(:, 1).*X(:, 2).*X(:, 2);
%     new_X(:, 9) = X(:, 2).*X(:, 2).*X(:, 2);
%     
%     %Incluce 4th order terms
%     new_X(:, 10) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1);
%     new_X(:, 11) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2);
%     new_X(:, 12) = X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2);
%     new_X(:, 13) = X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 14) = X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
%     
%     %Incluce 5th order terms
%     new_X(:, 15) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1);
%     new_X(:, 16) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2);
%     new_X(:, 17) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2);
%     new_X(:, 18) = X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 19) = X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 20) = X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
%     
%     %Incluce 6th order terms
%     new_X(:, 21) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1);
%     new_X(:, 22) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2);
%     new_X(:, 23) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2);
%     new_X(:, 24) = X(:, 1).*X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 25) = X(:, 1).*X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 26) = X(:, 1).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
%     new_X(:, 27) = X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2).*X(:, 2);
end