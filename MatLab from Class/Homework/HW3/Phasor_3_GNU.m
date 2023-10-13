clc
clear all
format compact
A=0.6;
XC=16;
ph=2.75;


Zc=-j*XC
V=Zc*A
Vm=abs(V)
Vph=angle(V)