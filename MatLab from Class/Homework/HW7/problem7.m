clc
clear all
format compact
R=5e3; %1e3;
L=2; %7;
C=20e-9; %85e-9;
Is=40; %85;
f=5000; %1250;
om=2*pi*f;
ZL=j*om*L;
ZC=-j/(om*C);
Z1=R+ZC;
%ZT=1/(1/Z1 + 1/ZL);
%Vs = Is*Z1;
Irms=Is/sqrt(2);
%Vrms=Vs/sqrt(2);
iL = Irms*(ZL/(ZL+ZC+R));
vL = iL*(R+ZC);
%Using Complex Power
S=(vL*conj(iL));
Pav=abs(real(S))
Q=abs(imag(S))