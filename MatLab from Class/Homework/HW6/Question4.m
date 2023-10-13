clc
clear all
format compact
%input data
f=14e3;
Vs=20*exp(j*1.25);
Rs=8;
R1=14;
R2=7;
R3=8;
L1=0.14e-3;
L2=0.03e-3;
C=0.65e-6;
omega=2*pi*f;
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC=-j/(omega*C);
Z1=R1+ZL1;
Z2=R2+ZL2;
Z3=R3+ZC;
%nodal analysis to find Vth
G=[1/Rs+1/Z1+1/Z2, -1/Z2;...
   -1/Z2, 1/Z2+1/Z3];
Is=[Vs/Rs;...
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
%finding Zml
Zml=conj(Zth)
%COME BACK AND FIND INDUCATNCE OF MATCHING LOAD
Xlm=imag(Zml);
Llm=Xlm/omega
