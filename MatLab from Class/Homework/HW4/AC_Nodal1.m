clc
clear all
format compact
%input data
Vs1=13*exp(j*1.4);
Is2=.038*exp(j*1.4);
R1=8;
R4=6;
XL2=7; 
XC3=7;
%impedenances
ZL2=j*XL2;
ZC3=-j*XC3;
Y=[1/R1+1/ZL2+1/ZC3,1/-ZC3; ...
   -1/ZC3,1/ZC3+1/R4];
Is=[Vs1/R1;Is2];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)
