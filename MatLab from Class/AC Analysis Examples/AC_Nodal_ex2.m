clc
clear all
format compact
%input data
Vs1=10*exp(j*0.3);
Vs2=12*exp(j*0.1);
R1=5; R2=12;R3=12;
ZL1=j*15; ZL2=j*20;
ZC1=-j*10;
Z1=R1+ZL1;
Y=[1/Z1+1/R2+1/ZL2,-1/ZL2; ...
   -1/ZL2, 1/ZL2+1/R3+1/ZC1];
Is=[Vs1/Z1;Vs1/ZC1+Vs2/R3];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)
%the current thorugh C1 from Left to Right
IC1=(Vs1-F(2))/ZC1;
ICm=abs(IC1)
ICph=angle(IC1)