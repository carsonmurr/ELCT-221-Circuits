%transfer function plots using various scales
clc
clear all
format compact
%input data
Vs=1;
L=1;C1=0.5;C2=0.5; R=1; 
fmin=0.01; fmax=0.5; %we define the start and end frequencies
df=0.01; % the frequency step 
nf=(fmax-fmin)/df+1; % the required number of frequency steps 
for n=1:nf; % start of frequency loop; n is a counter
f=fmin+df*n; % f takes the value of fmin +(frequency step) * (loop number)
om=2*pi*f;
ZL=j*om*L; %regular nodal analysis block. Note that om is a single number
ZC1=-j/(om*C1);
ZC2=-j/(om*C2);
Y=[1/ZL+1/ZC1+1/ZC2, -1/ZC2;...
-1/ZC2,1/ZC2+1/R];
Is=[Vs/ZL;0];
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


