clc
clear all
format compact
%input data
R1=70;
R2=150;
L1=24e-6;
C1=0.8e-9;
f=1e6;
omega=f*2*pi;
Vsm=10;
Vsph=0.1;
%finding impedances
ZL1=j*omega*L1;
Z1=1/((1/ZL1)+(1/R2));
Z2=R1+Z1;
ZC1=-j*(1/(omega*C1));
Ztotal=1/((1/ZC1)+(1/Z2));
Vtotal=Vsm*exp(j*Vsph);
Itotal=Vtotal/Ztotal;
Im=abs(Itotal);
Iph=angle(Itotal);
Vangle=(Vsph*180)/pi
Iangle=(Iph*180)/pi