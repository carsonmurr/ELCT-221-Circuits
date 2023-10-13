clc
clear all
format compact
%input data
Vs1=15*exp(j*0.1);
Vs2=4*exp(j*0.2);
Vs3=4*exp(j*0.1);
f=20e3;
R1=2e3;
L1=44e-3;
L2=38e-3;
C1=3e-9;
omega=f*2*pi;
%impedances
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC1=-j*(1/(omega*C1));
%matrices
Z=[ZL1+ZC1, 0, -ZC1; ...
   0, ZL2+R1, -R1; ...
   -ZC1, -R1, R1+ZC1];
Vs=[Vs1; Vs2-Vs1; -Vs3];
Imesh=Z\Vs;
%current through L2 from left to right
IL2=Imesh(2);
IL2m=abs(IL2)
IL2ph=angle(IL2)
%current through C1 flowing down
IC1=Imesh(1)-Imesh(3);
IC1m=abs(IC1)
IC1ph=angle(IC1)
%voltage above C1
% Fa=(Imesh(1)-Imesh(2))*ZC1;
% Fam=abs(Fa)
% Faph=angle(Fa)
Fa=Vs3-((Imesh(2)-Imesh(3))*R1);
Fam=abs(Fa)
Faph=angle(Fa)