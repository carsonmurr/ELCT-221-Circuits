clc
clear all
format compact

%input data
R=95;
L=20e-3;
C=4e-6;
Is=35*exp(i*5024);
Ief = (35e-3)/sqrt(2)
omega = 5024;
ZC = j * omega * L;
ZL = -j/(omega * C);
Pavg = Ief * Ief * R


