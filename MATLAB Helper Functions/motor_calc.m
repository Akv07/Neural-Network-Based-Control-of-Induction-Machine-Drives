function[frat, Vref, Vbus, IL, Ts, Tsys] = motor_calc()
%Motor Parameters
r1 = 1.405;
l1  = 0.005839;
r2 = 1.395;
l2 = 0.005839;
Lm = 0.1722;

%Motor Rated Values
Vrat = 400;
frat = 50;
x1 = 2*pi*frat*l1;
x2 = 2*pi*frat*l2;
Xm = 2*pi*frat*Lm;
Prat = 4*1000;
Nrat = 1430;
Ns = 120*frat/4;
nrat = Nrat*2*pi/60;
ns = Ns/60;
srat=1;
srat = (Ns-Nrat)/Ns;

E1 = Vrat/sqrt(3); %phase voltage
IL = E1/( (r1 + (1i*x1) ) + ( ( (1i*x2) +(r2/srat) )*1i*Xm / ( (1i*Xm) + (1i*x2) + (r2/srat) ) ) );
E2 = E1 - (IL*(r1 + (1i*x1) ) );
Trat = (3/(2*pi*ns))*srat*abs(E2)*abs(E2)*r2/((r2*r2) + (srat*srat*x2*x2));
%Trat = Prat/nrat;

%System Variables
Tsys = (1e-6);
Ts = (100e-6);

% Vbus = abs((400))*sqrt(2/3)*2/sqrt(3);
% Vbus_rms = Vbus/sqrt(2)
% Vref =Vbus*sqrt(3)/2;
% Vref_rms = Vref/sqrt(2)

Vbus = ((abs((400))*sqrt(2/3)*2/sqrt(3)));
Vbus_rms = Vbus/sqrt(2);
Vref = Vbus*sqrt(3)/2;
Vref_rms = Vref/sqrt(2);

freq = frat;
delay = Ts/Tsys;

% Motor Starting Parameters
inc_time = 0.2;

end