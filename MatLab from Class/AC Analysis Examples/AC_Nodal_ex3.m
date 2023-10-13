%example on slides with 2 current sources 
clc
clear all
format compact
%input data
Vs1=10*exp(j*0.3);
Is1=2*exp(j*0.1);
Is2=2.5*exp(j*0.2);
R1=5; R2=12;
ZL1=-j*15; ZL2=j*20;
ZC2=-j*10;
Y=[1/R1+1/ZL1,-1/ZL2,0; ...
   -1/ZL1,1/ZL1+1/ZC2+1/ZL2,-1/ZL2; ...
   0,-1/ZL2,1/ZL2+1/R2];
Is=[Vs1/R1+Is1;...
    0;...
    Is2-Is1];
F=Y\Is;
Fm=abs(F)
Fph=angle(F)