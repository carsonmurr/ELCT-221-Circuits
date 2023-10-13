clc
clear all
format compact
%input data
R1=7;
XL1=11;
XC2=8;
XL2=8;
XC3=11;
R3=7;
Vs1=10;
Vs2=45*exp(j*0.8);
%impedances
ZL1=j*XL1;
ZL2=j*XL2;
ZC2=-j*XC2;
ZC3=-j*XC3;
%matrices
Z=[ZL1+R1+ZC2, -ZC2, 0; ...
   -ZC2, ZC2+ZL2+ZC3, -ZC3; ...
   0, -ZC3, ZC3+R3];
Vs=[Vs1;0;-Vs2];
Imesh=Z\Vs;
Imeshm=abs(Imesh)
Imeshph=angle(Imesh)