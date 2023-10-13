clc
clear all
format compact
%input data
f=24e6;
Vs=20*exp(j*0.25);
R=25;
L1=0.65e-6;
C1=175e-12;
C2=80e-12;
omega=2*pi*f;
ZL1=j*omega*L1;
ZC1=-j/(omega*C1);
ZC2=-j/(omega*C2);
%nodal analysis to find Vth
G=[1/R+1/ZC1+1/ZL1, -1/ZL1;...
    -1/ZL1, 1/ZL1+ 1/ZC2];
Is=[Vs/R;...
    0];
F=G\Is;
Vth=F(2);
Vthm=abs(Vth)
Vth_ph=angle(Vth)
%finding Zth
Ise=1;
Is2=[0;...
    Ise];
F2=G\Is2;
Zth=F2(2)/Ise
%finding load Zml
Zlm=conj(Zth)
%COME BACK TO FIND inductances OF MATHCING LOAD IMPEDANCE
Xlm=imag(Zlm);
Llm=Xlm/omega