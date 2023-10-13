clc
clear all
format compact 
%input data
R1=65;
R2=80;
L1=26e-6;
C1=8e-9;
f=1e6;
omega=2*pi*f;
Vm=15;
ph=0.1;
Vs=Vm*exp(j*ph)
%finding total impedance
ZC1=-j*(1/(omega*C1));
Z1= 1/((1/ZC1)+(1/R2));
ZL1=j*omega*L1;
Z2=ZL1+Z1;
Ztotal=1/((1/Z2)+(1/R1))
%finding total current
Itotal=Vs/Ztotal;
Im=abs(Itotal)
Iph=angle(Itotal);
Vdeg=(ph*180)/pi
Ideg=(Iph*180)/pi