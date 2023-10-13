clc
clear all
format compact
%input data
R=4;
XL=5;
E=92;
ZL=j*XL;
%nodal analysis
G=[1/R+1/ZL];
Is=[E/R];
F=G\Is
Fm=abs(F)
Fph=angle(F)
%finding thevenin impedance
Ise=1;
Is2=[Ise];
F2=G\Is2;
Zth=F2/Is2