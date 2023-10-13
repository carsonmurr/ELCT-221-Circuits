clc
clear all %u =E-6 n=E-9 p=E-12 M=E6 omega=2*pi
format compact
%input data
R1=125;
R2=165;
L1=30e-6;
L2=23e-6;
C1=11e-9;
C2=9e-9;
f=1e6;
omega=2*pi*f;
Vsm=13;
Vsph=0.1;
%Finding Impedances
ZC1=-j*(1/(omega*C1));
ZC2=-j*(1/(omega*C2));
ZL1=j*omega*L1;
ZL2=j*omega*L2;

Z1=R2+ZC2; %impedance of R2 and C2 in series
Z2=1/((1/ZL2)+(1/Z1)); %impedance of Z1 and L2 in parallel
Z3=ZC1+Z2; %impedance of Z2 and C1 in series
Z4=1/((1/Z3)+(1/(ZL1))); %impedance of Z3 and L1 in parallel
Ztotal=Z4+R1 %total impedance

%finding Current
Vtotal=Vsm*exp(j*Vsph); 
Itotal=Vtotal/Ztotal; %finding total current using Ohm's law
Im=abs(Itotal)
Iph=angle(Itotal)

%phasors for Voltage and current
Vangle=(Vsph*180)/pi %Voltage phase in deg
Iangle=(Iph*180)/pi %Current phase in deg