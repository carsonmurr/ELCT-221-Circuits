clc
clear all
format compact

M0=4e-1;
omc=1e4;
om=1e6;
H=M0*j*(om/omc)/(1+j*om/omc);
M=abs(H)