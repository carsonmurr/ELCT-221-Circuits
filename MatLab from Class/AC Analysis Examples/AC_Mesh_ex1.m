clc
clear all
format compact
%input data
Vs1=7.5;
Vs2=20*exp(-j*0.7);
R1=5; R2=10; R3=4; R4=5;
ZL3=j*62.8; ZC1=j*26.5;
Z=[R1+R2,-R2,0; ...
   -R2,R2+R3+ZL3+ZC1,-ZC1; ...
   0,-ZC1,ZC1+R4];
Vs=[Vs1;0;-Vs2];;  %Voltage Matrix
Imesh=Z\Vs;
Imeshm=abs(Imesh)
Imeshph=angle(Imesh)
IC=Imesh(2)-Imesh(3);
ICm=abs(IC)
ICph=angle(IC)