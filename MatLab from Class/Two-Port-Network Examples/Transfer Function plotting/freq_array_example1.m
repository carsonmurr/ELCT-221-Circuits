clear all
clc
close all
Vin=1;
f=50e6:50e6:5e9; %frequency array
R=50;C=3e-12;
om=2*pi*f;  %note om is an array here
ZC=-j./(om*C); %note "./" to divide element per element 
ZT=R+ZC;
I=Vin./ZT; %note "./" to divide element per element
%Output voltage = VR (High-pass)
Vout=I*R;
H=Vout/Vin; 
M=abs(H);
MdB=20*log10(M); % M in dB
Phi_deg=angle(H)*180/pi;
figure(1)
semilogx(f,MdB) %dB, log scale f
grid on
title('Magnitude, dB')
xlabel('f,Hz')
figure(2)
semilogx(f,Phi_deg) %phase, log scale f
grid on
title('Phase, deg')
xlabel('f,Hz')
