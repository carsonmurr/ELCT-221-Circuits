clc
clear all
format compact
R1=39; R2=31;
L=89e-6;
C=26e-9;
Vs=35;
f=160e3;
om=2*pi*f;
ZL=j*om*L;
ZC=-j/(om*C);
Z1=(R1*ZC)/(R1+ZC);
ZT=Z1+ZL+R2;
Vrms=Vs/sqrt(2);
I=Vs/ZT;
Irms=Vrms/ZT;
%Using Complex Power
S=Vs*conj(I)/2;
Pav=abs(real(S))
Q=abs(imag(S))
%Using P=iv
Piv=Irms*Vrms;
Pav2=abs(real(Piv))
Q2=abs(imag(Piv))
%Using P=V^2/R
Pv2=Vrms^2/ZT;
Pav3=abs(real(Pv2))
Q3=abs(imag(Pv2))
%Using effective values
Iph=angle(I);
Vph=angle(Vs);
Pav3=Vrms*Irms*cos(Vph-Iph);
Pav4=abs(Pav2)
Q3=Vrms*Irms*sin(Vph-Iph);
Q4=abs(Q2)