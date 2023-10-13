clc
clear all
format compact
%input data
f=20e6;
E=20;
R=2e3;
C=2.65e-12;
L=47.8e-6;
omega=2*pi*f;
ZC=-j/(omega*C);
ZL=j*omega*L;
%mesh analysis for Norton transform
Z=[R+ZC, -ZC;...
   -ZC,ZL+ZC];
Vs=[E;...
    0];
Imesh=Z\Vs;
INort=Imesh(2);
INortm=abs(INort)
INortph=angle(INort)
%finding norton impedance
ZN=(1/((1/R)+(1/ZC)))+ZL
%matching load impedance
Zlm=