clc
clear all
format compact

%input data
f=20e3;  %frequency
Vs=2.5;  %Voltage source
R=100;  %Resistor
C=0.1e-6;  %Capacitor
om=2*pi*f;  %omega

Zc=-j/(om*C) %capacitor impedance
Ztotal=R+Zc  %total impedence
I=Vs/Ztotal;  %Current
Vc=Zc*I;  %Voltage across capacitor
Im=abs(I)  %Magnitude of Current
Iph=angle(I)  %angle of Current (Phi)
Vcm=abs(Vc)  %Magnitude of Voltage across Capacitor 
Vcph=angle(Vc)  %angle of Voltage across Capacitor (Phi)