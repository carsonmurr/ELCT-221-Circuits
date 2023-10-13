clc
clear all
format compact
%input data
f=20e6;
omega=2*pi*f;
E=20;
R=2e3;
C=2.65e-12;
L=47.8e-6;
%impedances
ZC=-j*1/(omega*C);
ZL=j*omega*L;
%nodal analysis
G=[1/R+1/ZC+1/ZL, -1/ZL;...
   -1/ZL, 1/ZL];
Is=[E/R;...
    0];
Phi=G\Is;
VTh=Phi(2);
VThm=abs(VTh)
VThph=angle(VTh)
%method 1 equivalent impedance
ZTh=ZL+R*ZC/(R+ZC);  %R and C in parallel, L in series with them
disp("equivalent series resistance")
Rs=real(ZTh);
%Equivalent series reactance
Xs=imag(ZTh)
%The equivalent circuit contains either inductance if Xs>0 or capacitance
%if Xs <0
if (Xs>0),disp('equivalent series inductance: '), Ls=Xs/omega,...
else disp('equivalent series capacitance: '), Cs=-1/Xs/omega, end
%method 2 equivalent source
Ise=1; %external current source
Is2=[0;...
     Ise];
Phi2=G\Is2;
ZTh2=Phi2(2)/Ise;
ZTh2m=abs(ZTh2)
ZTh2ph=angle(ZTh2)

