clear all
clc
format compact
R1=55; R2=10.4; XL1=65; XC1=26;
Z1=-j*XC1+R2;
Z2=1/((1/Z1)+(1/R1));
Ztotal=Z2+j*XL1