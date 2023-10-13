clear all
clc
format compact
%input data
L2= 2.9e-3;
R1=8.1;
omega=1000;
Vb=9.5*exp(1000*j);
Vm=9.5;
Vph=0;

Ztotal=R1+j*omega*L2;
Itotal=Vb/Ztotal;
Im=abs(Vm/Ztotal)
Iph=angle(Itotal)