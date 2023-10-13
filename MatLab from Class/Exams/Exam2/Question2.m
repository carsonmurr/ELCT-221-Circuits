clc
clear all
format compact
%input data
Vs1=14*exp(j*0.1);
Vs2=4*exp(j*0.1);
f=20e3;
omega=2*pi*f;
R1=3e3; R2=3e3; R3=4e3; R4=4e3;
L1=22e-3; 
C1=3.5e-9;
%Finding Impedances
ZL1=j*omega*L1;
ZC1=-j*(1/(omega*C1));
%Mesh Analysic
Z=[R1+R2+ZL1, -R2, -ZL1; ...
   -R2, R2+R3, 0; ... 
   -ZL1, 0, ZL1+ZC1+R4];
Vs=[Vs1; Vs2; -Vs2];
Imesh=Z\Vs;
%Current through L1 flowing downwards
IL1=Imesh(1)-Imesh(3);
IL1m=abs(IL1)
IL1ph=angle(IL1)
%Current through C1 flowing downwards
IC1=Imesh(3);
IC1m=abs(IC1)
IC1ph=angle(IC1)
%potential at the top lead of resistor R1
VR1=Vs1-(Imesh(1)*R1);
VR1m=abs(VR1)
VR1ph=angle(VR1)
%MATLAB OUTPUT
% IL1m =
%     0.0031
% IL1ph =
%    -0.8010
% IC1m =
%     0.0013
% IC1ph =
%     1.7093
% VR1m =
%     8.9949
% VR1ph =
%     0.4901
