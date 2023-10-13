clc
clear all
format compact
ph=75*(pi/180);
Vs=123*exp(j*ph);
R1=4;
R2=8;
ZC=-j*6;
ZL=j*12;
%nodal analysis to find Vth
Y=[1/ZC+1/R2, 0;...
   0, 1/ZL+1/R1];
Is=[Vs/ZC; Vs/R1];
F=Y\Is;
Vth=F(1)-F(2);
Vthm=abs(Vth)
Vth_ph=angle(Vth)
%Zth using external current source
Ie=1;
Is2=[Ie; -Ie];
Fe=Y\Is2;
Zth=(Fe(1)-Fe(2))/Ie