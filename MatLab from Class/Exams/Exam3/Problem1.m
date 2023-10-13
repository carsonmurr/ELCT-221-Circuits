clc
clear all
format compact
% mili=e-3  micro=e-6  nano=e-9  pico=e-12 
%input data
f=4e3;
Vs=8*exp(j*0.2);
R1=25;
R2=35;
L1=3e-3;
L2=0.2e-3;
C1=0.3e-6;
omega=2*pi*f;
ZL1=j*omega*L1;
ZL2=j*omega*L2;
ZC1=-j/(omega*C1);
Z1=R1+ZL1;
%nodal analysis for Thevenin Source
G=[1/Z1+1/ZC1+1/ZL2, -1/ZL2;...
   -1/ZL2, 1/ZL2+1/R2];
Is=[Vs/Z1;...
    0];
F=G\Is;
Vth=F(2);
Vthm=abs(Vth)
Vth_ph=angle(Vth)
%finding Thevenin Impedance
Ise=1;
Is2=[0;...
    Ise];
F2=G\Is2;
Zth=F2(2)/Ise;
Zth_real=real(Zth)
Zth_imag=imag(Zth)

%%%%%%%%% MATLAB OUTPUT %%%%%%%%%%%%%
% Vthm =
%     3.0164
% Vth_ph =
%    -0.9354
% Zth_real =
%    30.3426
% Zth_imag =
%     4.1138