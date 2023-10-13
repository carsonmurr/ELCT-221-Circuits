clc
clear all
format compact
%input data
E=20;
R1=2;
R2=2;
XL=4;
XC=5;
ZL=j*XL;
ZC=-j*XC;
%nodal analysis
Y=[1/R1+1/R2+1/ZL+1/ZC];
Is=[E/R1];
F=Y\Is;
%voltage across R1
VR1=E-F;
%current through R1
IR1=VR1/R1;
%power in R1
SR1=VR1*conj(IR1)/2;
PR1=real(SR1)
QR1=imag(SR1)
%powers in R2, C, and L
%Voltages across R2, C, L = F
IR2=F/R2;
IC=F/ZC;
IL=F/ZL;
SR2=F*conj(IR2)/2;
PR2=real(SR2)
QR2=imag(SR2)
SC=F*conj(IC)/2;
PC=real(SC)
QC=imag(SC)
SL=F*conj(IL)/2;
PL=real(SL)
QL=imag(SL)
