clear all
clc
Vs1=10; Is2=2;
R1=1; R2=2; R3=5; R4=10;
G=[1/R1+1/R2+1/R3,-1/R2;...
   -1/R2,1/R2+1/R4];
Is=[Vs1/R1;Is2];
F=G\Is;
Phi1= F(1)
Phi2= F(2)