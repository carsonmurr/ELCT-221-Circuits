clc
clear all
format compact
%input data
f=1e6;
omega=2*pi*f;
R1=5; R2=7;
L1=0.8e-6;
C1=30e-9;
C2=23e-9;
Vs=10*exp(j*0.1);
Is=0.4*exp(j*0.3);
%finding impednaces
ZL1=j*omega*L1;
ZC1=-j*(1/(omega*C1));
ZC2=-j*(1/(omega*C2));
%Nodal Analysis
Z2=R2+ZC2;
G=[1/R1+1/ZC1+1/ZL1, -1/ZL1; ...
   -1/ZL1, 1/ZL1+1/Z2];
Is=[Vs/R1+Is; -Is];
F=G\Is;
%Finding potential at the left lead of L1
F1=F(1);
F1m=abs(F1)
F1ph=angle(F1)
%Finding potential at the Right lead of L1
F2=F(2);
F2m=abs(F2)
F2ph=angle(F2)
%current through the component C2-R2 flowing downward
IZ2=F2/Z2;
IZ2m=abs(IZ2)
IZ2ph=angle(IZ2)
%MATLAB OUTOUT
% F1m =
%     4.7104
% F1ph =
%    -0.3616
% F2m =
%     8.3528
% F2ph =
%    -1.1378
% IZ2m =
%     0.8486
% IZ2ph =
%    -0.3582
