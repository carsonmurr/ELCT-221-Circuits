clear all
clc
format compact

%input data
R1=3.3;
L2=2.8e-3;
C=4.3e-6
omega=10000;

ZL=j*omega*L2;
ZC=j*(1/(omega*C));
Ztotal=1/((1/R1)+(1/ZL)+(1/ZC));
VTotal=3*Ztotal
IC=VTotal/ZC
ICm=abs(IC)