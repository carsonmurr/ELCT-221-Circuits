clc
clear all
format compact
%input data
Vms1=7.5;
Vms2=20*exp(j*-0.7);
R1=5;
R2=10;
R3=4;
XL3=62.8;
R4=5;
XC1=26.5;
%impedances
ZL3=j*XL3;
ZC1=-j*XC1;  %might be -j*(1/XC1)
Z3=R3+ZL3;
%Nodal Analysis matrices
Y=[1/R1+1/R2+1/Z3,-1/Z3;...
   -1/Z3,1/R4+1/ZC1+1/Z3];
Is=[Vms1/R1;...
    Vms2/R4];
%Solution of matrix equation
%Y*F=Is if F=(Y^-1)*Is => F=Y\Is
F=Y\Is;
Fm=abs(F);
Fph=angle(F);
disp("Potential F1= "+Fm(1)+" Angle: "+Fph(1))
disp("Potential F2= "+Fm(2)+" Angle: "+Fph(2))