clc
clear all
format compact
%input data
R=6;
XL=3;
XC=6;
Vs1=6;
Vs2=45*exp(j*1);
%impedances
ZL=j*XL;
ZC=-j*XC;
%matrices
Z=[ZL+R, -ZL; ...
   -ZL, ZL+ZC];
Vs=[Vs1;-Vs2];
Imesh=Z\Vs;
%current through R
IR=Imesh(1);
IRm=abs(IR);
IRph=angle(IR);
%current through Inductor flowing down
IL=Imesh(1)-Imesh(2);
ILm=abs(IL);
ILph=angle(IL);
%voltage across inductor
FL=IL*ZL;
FLm=abs(FL)
FLph=angle(FL)