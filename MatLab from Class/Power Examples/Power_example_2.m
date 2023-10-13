clear all
clc
format compact
% <<< AC Nodal analysis >>> 
%input data
Vs1m=7.5;
Vs2m=20; Vs2ph=-0.7;
R1=5;R2=10;R3=4;R4=5;
XL3=62.8; XC1=26.5;
%Complex amplutes and impedances
Vs1=Vs1m; %complex amplitude of Vs1(t)
Vs2=Vs2m*exp(j*Vs2ph);
ZL3=j*XL3;
ZC1=-j*XC1;
Z3=R3+ZL3;
%Y and Is matrices
Y=[1/R1+1/R2+1/Z3,-1/Z3;...
-1/Z3,1/Z3+1/ZC1+1/R4];
Is=[Vs1/R1;Vs2/R4];
Phi=Y\Is;
V3=Phi(1)-Phi(2);
I3=V3/Z3;
% <<< Power calculations >>>
S=V3*conj(I3)/2;
P=real(S) % active power in Z3
Q=abs(imag(S)) % abs. value of
                     % reactive power in Z3
