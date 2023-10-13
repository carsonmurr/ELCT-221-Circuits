clc
clear all
format compact
%input data
Vs1=80*exp(j*0.1);
Vs2=170*exp(j*0.2);
f=20e3;
R1=3.5e3; R2=7e3; R3=6e3; 
L1=24e-3; L2=34e-3;
C1=2e-9;
omega=2*pi*f;
%impedances
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC1=-j*(1/(omega*C1));
%matrices
Z=[R1+R2+ZL1, -R2, -ZL1; ...
   -R2, R2+R3+ZL2, -ZL2; ...
   -ZL1, -ZL2, ZL1+ZL2+ZC1];
Vs=[Vs1; Vs2; 0];
Imesh=Z\Vs;
%Current through R1
IR1=Imesh(1);
IR1m=abs(IR1)
IR1ph=angle(IR1)
%Current through L2
IL2=Imesh(2)-Imesh(3);
IL2m=abs(IL2)
IL2ph=angle(IL2)
%potential at point a
Fa=Vs1-(Imesh(1)*R1);
Fam=abs(Fa)
Faph=angle(Fa)