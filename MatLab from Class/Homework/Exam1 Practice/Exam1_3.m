clc
clear all
format compact
%input data
R1=150;
L1=14e-6;
L2=16e-6;
C1=1.2e-9;
f=1e6;
omega=f*2*pi;
Vsm=18;
Vsph=0.1;
%finding impedances
Z1=j*omega*(L1+L2);
Ztotal=1/((1/Z1)+(1/R1)+(1/(-j*(1/(omega*C1)))))
%finding current
Vtotal=Vsm*exp(j*Vsph);
Itotal=Vtotal/Ztotal;
Im=abs(Itotal);
Iph=angle(Itotal);
Vangle=(Vsph*180)/pi
Iangle=(Iph*180)/pi