clc
clear all
format compact

omega = 10000;
ig = 80*exp(j*10000)
L1 = 5e-3;
L2 = 2e-3;
R = 9; %10.9;
C = 10e-6;
ZL1 = j * omega * L1
ZL2 = j * omega * L2
ZC = -j/(omega*C);
Zeq = ZL1 + (1/(1/R + 1/ZL2 + 1/ZC))
V = Zeq * ig
Istar = 80*exp(-j*10000)
%Vef = V/sqrt(2);
%Ief = (80e-3)/sqrt(2);
Pavg = ((V*Istar)/2) %* cos(imag(V) - imag(ig))