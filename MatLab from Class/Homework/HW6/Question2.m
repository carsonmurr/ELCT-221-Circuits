clc
clear all
format compact
%input data
Vs=28*exp(j*0.75);
Is1=20e-3*exp(j*0.25);
f=20e6;
omega=f*2*pi;
R1=4e3;
L1=65e-6;
C1=2e-12;
ZC1=-j/(omega*C1);
ZL1=j*omega*L1;
%nodal analysis to find Vth
G=[1/R1+1/ZC1+1/ZL1, -1/ZC1;...
   -1/ZC1, 1/ZC1];
Is=[Vs/R1;
    Is1];
F=G\Is;
Vth=F(2)
Vthm=abs(Vth)
Vth_ph=angle(Vth)
%finding Zth
Zth=ZC1+(1/((1/R1)+(1/ZL1)))