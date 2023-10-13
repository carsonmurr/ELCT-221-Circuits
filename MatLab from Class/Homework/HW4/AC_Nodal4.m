clc
clear all
format compact
%input data
R1=5; R2=6;
L1=0.9e-6; L2=L1;
C1=20e-9; C2=17e-9;
Vs1=12*exp(j*0.16);
Is1=0.4*exp(j*0.16);
f=1e6;
omega=f*2*pi;
%impedances
ZL1=j*omega*L1;
ZL2=ZL1;
ZC1=-j*(1/(omega*C1));
ZC2=-j*(1/(omega*C2));
%matrix
Y=[1/R1+1/ZC1+1/ZL1, -1/ZL1, -1/ZC1; ...
   -1/ZL1, 1/ZL1+1/ZC2+1/ZL2, -1/ZL2; ...
   -1/ZC1, -1/ZL2, 1/ZL2+1/ZC1+1/R2];
Is=[Vs1/R1;0;Is1];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)
%current through R2 downwards
IR2=F(3)/R2;
IR2m=abs(IR2)
IR2ph=angle(IR2)