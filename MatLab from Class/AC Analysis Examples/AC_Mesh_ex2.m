clc
clear all
format compact
%input data
Vs1=10*exp(j*0.3);
Vs2=12*exp(0.1);
R1=5; R2=12; R3=12;
XL1=15; XL2=20;
XC1=10;
ZL1=j*XL1; ZL2=j*XL2;
ZC1=-j*XC1;
%mesh analysis matrices
Z=[R1+ZL1+R2,-R2,-R1-ZL1; ...
   -R2, R2+ZL2+R3,-ZL2; ...
   -R1-ZL1, -ZL2, R1+ZL1+ZL2+ZC1];
Vs=[Vs1;-Vs2;0];
Imesh=Z\Vs;
Imeshm=abs(Imesh)
Imeshph=angle(Imesh)
IC1=Imesh(3);
IC1m=abs(IC1)
IC1ph=angle(IC1)
%potential Phi a
Fa=Imesh(1)-Imesh(2)*R2;
Fam=abs(Fa)
Faph=angle(Fa)
%potential of Phi b
Fb=Imesh(2)*R3+Vs2;
Fbm=abs(Fb)
Fbph=angle(Fb)