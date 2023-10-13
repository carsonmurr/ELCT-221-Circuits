clc
clear all
format compact
%input data
R1=60; 
R2=85;
L1=30e-6;
L2=19e-6;
C1=8e-9;
C2=10e-9;
f=1e6;
Vs1=15*exp(j*0.15);
omega=2*pi*f;
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC1=-j/(omega*C1);
ZC2=-j/(omega*C2);
Z1=R1+ZL1+ZC1;
Z2=1/((1/R2)+(1/ZL2)+(1/ZC2));
%mesh analysis for norton transform
Z=[Z1, -Z1;...
   -Z1, Z1+Z2];
Vs=[Vs1;...
    0];
Imesh=Z\Vs;
INort=Imesh(2);
INortm=abs(INort)
INortph=angle(INort)
%finding norton equivalent impedance
%Zth=Z1+Z2
Zth=1/(1/((1/Z1)+(1/Z2)))