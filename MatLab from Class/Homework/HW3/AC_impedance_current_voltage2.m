clear all
clc
format compact

R1=140; R2=72; XL1=80; XC1=29.9;
VSm=8; Vsph=1; %in rad
Z1=R2-(j*XC1);
Z2=1/((1/R1)+(1/Z1));
Z3=j*XL1;
Ztotal=Z2+Z3;
Zm=abs(Ztotal);
Vtotal=4.322+6.732*j;
Vm=abs(Vtotal);
Itotal=Vtotal/Ztotal;
Im=abs(Itotal)
Iph=angle(Itotal)
VL1= Itotal*Z3;
VL1ph=angle(VL1);
VL1m=abs(VL1);
V2=Vm-VL1m

