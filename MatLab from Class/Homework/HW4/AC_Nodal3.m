clc
clear all
format compact
%input data
R1=4;
R2=5;
R3=6;
XL1=8;
XL2=3.5;
XC1=2.8;
Vs1=9*exp(j*0.14);
ZL1=j*XL1;
ZL2=j*XL2;
ZC1=-j*XC1;
Y=[1/R1+1/ZL1+1/R2, -1/ZL1, -1/R2; ...
   -1/ZL1, 1/ZL1+1/ZC1+1/R3, -1/ZC1; ...
   -1/R2, -1/ZC1, 1/R2+1/ZL2+1/ZC1];
Is=[Vs1/R1;0;0];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)
%current flowing through C1 from left to right
IC1=(F(2)-F(3))/ZC1;
IC1m=abs(IC1)
IC1ph=angle(IC1)