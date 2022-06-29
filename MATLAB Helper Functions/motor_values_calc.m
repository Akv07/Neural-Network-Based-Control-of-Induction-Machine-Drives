%Motor Parameters
r1 = 1.405;
l1  = 0.005839;
r2 = 1.395;
l2 = 0.005839;
Lm = 0.1722;
P = 4;
J = 0.0131;

%Motor Rated Values
Vrat = 400;
frat = 50;
Prat = 4*1000;
Nrat = 1430;

x1 = 2*pi*frat*l1;
x2 = 2*pi*frat*l2;
Xm = 2*pi*frat*Lm;
Ns = 120*frat/P;
nrat = Nrat*2*pi/60;
ns = Ns*2*pi/60;
srat = (Ns-Nrat)/Ns;

%Calculating Motor Currents
E = Vrat/sqrt(3);
R_Th = ((1i*Xm)*((1i*x2)+(r2/srat))) / ((1i*Xm)+((1i*x2)+(r2/srat)));

is = E / (r1+(1i*x1)+R_Th);
ir = (is*(1i*Xm)) / ((1i*Xm)+((1i*x2)+(r2/srat)));
im = is-ir;

%Vector Control
% imr_star = abs(im);
M = Lm;
Lr = l1+Lm;
Ls = l2+Lm;

sigma = 1 - ((M*M) / (Lr*Ls));
sigma_r = (Lr/M) - 1;

% psi_r_star = imr_star*(1+sigma_r)*M;
psi_r_star = real((Lm*im) + (l2*ir));
imr_star = psi_r_star / (M);
isd_star = imr_star;

Kt = (2/3) * (P/2) * (1 / (1+sigma_r)) * psi_r_star;

% IL = E/( (r1 + (1i*x1) ) + R_Th );
% E2 = E - (IL*(r1 + (1i*x1) ) );
% Trat = (3/(ns))*srat*abs(E2)*abs(E2)*r2/((r2*r2) + (srat*srat*x2*x2));

Trat = Prat/nrat;
isq_star = Trat / (isd_star*Kt);