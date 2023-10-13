clc
clear all
format compact
%input data
R1=7;
XL1=4;
XC2=3;
XL2=12;
XC3=3;
R3=9;
Vs1=10;
Vs2=33*exp(j*1.2);
ZL1=j*XL1;
ZC2=-j*XC2;
ZL2=j*XL2;
ZC3=-j*XC3;
Z1=R1+ZL1;
Y=[1/Z1+1/ZC2+1/ZL2,-1/ZL2; ...
   -1/ZL2,1/ZL2+1/ZC3+1/R3];
Is=[Vs1/Z1;Vs2/R3];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)
%current through L2 flowing right to left
IL2=(F(1)-F(2))/ZL2;
IL2m=abs(IL2)
IL2ph=angle(IL2)