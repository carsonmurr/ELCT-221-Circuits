clc
clear all
format compact

%input data
R1= 2e3;
R2=4e3;
L=3e-3;
C=1e-9;
omega=1e6;
Vsm=16;

%impedances
Zc=-j/(omega*C);  %impedance of capacitor
ZL=j*omega*L;  %impedance of inudctance
Z1=R1+Zc;  %impdeance of R1 and capacitor that are in series
Z2=ZL*R2/(ZL+R2);  %impedance of R2 and inductor that are in parallel
Ztotal=Z1+Z2

%Total Current in the circuit
ITotal=Vsm/Ztotal;
ITm=abs(ITotal)  %amplitude of total current
ITph=angle(ITotal)  %angle of total current in radians
