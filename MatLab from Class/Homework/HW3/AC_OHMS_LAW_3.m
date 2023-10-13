clear all
clc
format compact

%input data
R=7.6;
L=7.3e-3;
C=10e-6;
omega=1e4;
Vs=8.5;

Zc=-j*(1/omega*C);
ZL=j*omega*L;
ZTotal=1/((1/R)+(1/Zc)+(1/ZL));
ITotal=Vs/ZTotal;
Im=abs(ITotal);
il=Im*exp(j*omega);
ilm=abs(il);
IL=Vs/ZL;
ILm=abs(IL)
