clear all
clc
format compact
R1=115; XL1=80; XC1=32;
Zc=-j*XC1;
ZL=j*XL1;yt
Z1=1/((1/Zc)+(1/ZL));
Ztotal=Z1+R1