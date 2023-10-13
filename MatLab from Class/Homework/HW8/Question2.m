clc
clear all
format compact

Vs=1;
R=50;
C=2.5e-6;
L1=2e-3;
L2=3e-3;
fmin=0; fmax=12000; %we define the start and end frequencies
df=100; % the frequency step 
nf=(fmax-fmin)/df+1; % the required number of frequency steps 
for n=1:nf; % start of frequency loop; n is a counter
f=fmin+df*n; % f takes the value of fmin +(frequency step) * (loop number)
om=2*pi*f;
ZL1=j*om*L1; %regular nodal analysis block. Note that om is a single number
ZL2=j*om*L2;
ZC=-j/(om*C);
Y=[1/ZC+1/ZL1+1/ZL2, -1/ZL2;...
   -1/ZL2, 1/ZL2+1/R];
Is=[Vs/ZC;0];
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