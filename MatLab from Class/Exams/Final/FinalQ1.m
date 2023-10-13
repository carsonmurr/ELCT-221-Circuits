clc
clear all
format compact

%input data
R1=11;
R2=5;
L1=0.2e-3;
L2=0.07e-3;
C1=0.9e-6;
fmin=1e3;
fmax=100e3;
Vs=1;
df=0.1;
nf=(fmax-fmin)/df+1;
for n=1:nf; % start of frequency loop; n is a counter
f=fmin+df*n; % f takes the value of fmin +(frequency step) * (loop number)
om=2*pi*f;
ZL1=j*om*L1; %regular nodal analysis block. Note that om is a single number\
ZL2=j*om*L2;
ZC1=-j/(om*C1);
Z2=R2+ZL2;
Y=[1/R1+1/ZL1+1/Z2,-1/Z2;...
-1/Z2,1/Z2+1/ZC1];
Is=[Vs/R1;0];
F=Y\Is;
Vout=F(2);
H=Vout/Vs;
M(n)=abs(H); % accumulating M array
MdB(n)=20*log10(M(n)); % accumulating MdB array
Ph_deg(n)=angle(H)*180/pi; % accumulating Phase array
% We also need to remember the f values by accumulating them in f_plt array
f_plt(n)=f; % f_plt array (f value changes every time loop counter increases)
 end % after the end of the loop we have arrays of f_plt, M, MdB and Phase 
figure(1)
semilogx(f_plt,MdB)
title('M, dB')
xlabel('f, Hz')
grid on
figure(2)
semilogx(f_plt,Ph_deg)
title('Phase, deg')
xlabel('f, Hz')
grid on
