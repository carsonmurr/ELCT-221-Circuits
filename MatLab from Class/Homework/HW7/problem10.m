    clc
clear all
format compact
%input data
f=20e3;
Vs=20*exp(j*0.5);
Rs=10; R1=8; R2=9;R3=4;
L1=0.2e-3; L2=0.13e-3;
C=0.9e-6;
omega=2*pi*f;
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC=-j/(omega*C);

Z1=R1+ZL1;
Z2=R2+ZL2;
Z3=R3+ZC;
Y=[1/Rs+1/Z1+1/Z2, -1/Z2;...
   -1/Z2, 1/Z2+1/Z3];
Is=[Vs/Rs;...
    0];
F=Y\Is;
Vth=F(2);
Vthm=abs(Vth)
Vthph=angle(Vth)
Zrs=1/(1/Rs+1/Z1);
Zth=1/(1/(Zrs+Z2)+1/Z3);
Zthm=real(Zth)
Zthph=imag(Zth)
Zml=conj(Zth);
Zmlm=real(Zml)
Zmlph=imag(Zml);
Xml=imag(Zml)
Lml=Xml/omega

I3=F(2)/Z3;
Vrms=F(2)/sqrt(2);
Irms=I3/sqrt(2);
S=20*conj(abs(Irms)
Pav=abs(real(S))
Q=abs(imag(S))