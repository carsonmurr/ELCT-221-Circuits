clear all
clc
format compact
%input data
R1=50;
R2=R1;
L1=10e-6;
L2=L1;
C1=1e-9;
C2=C1;
f=3e6;

Vsm=12;
Vsph=0.3;
Vs=Vsm*exp(j*Vsph);
om=2*f*pi;

ZC1=-j*(1/(C1*om));
ZC2=ZC1;
ZL1=j*L1*om;
ZL2=ZL1;
Z2=1/((1/ZL2)+(1/ZC2)+(1/R2));
Z1=ZL1+R1+ZC1;
Ztotal=Z1+Z2

%Leq=imag(Ztotal)/om;  %equvialent to inductance (L)
% equivalent physical circuit of the input impedance
Req=real(Ztotal);
Imtotal=imag(Ztotal);
if Imtotal > 0
    %the equivalent circuit is Req and Leq in series
    %Leq can be found from XLeq = om * Leq
    XLeq = Imtotal;
    Leq = XLeq / om;
    disp("The equivalent impedance is a series connection of resistor and inductor")
    disp("Req (ohm) = "), disp(Req), disp("Leq (H) = "), disp(Leq)
else
    %the equivalent circuit is Req and Ceq in series
    %Ceq can be found from XCeq = 1/om*Ceq
    XCeq=-Imtotal;
    Ceq= 1/(om*XCeq);
    disp("The equivalent impedance is a series connection of resistor and capacitor")
    disp("Req (ohm) = "), disp(Req),disp("Ceq (F) = "), disp(Ceq)
end

Itotal=Vs/Ztotal;
VL1=Itotal*ZL1;  %voltage across LI
VL1m=abs(VL1)
VL1ph=angle(VL1)

VZ2=Itotal*Z2;  %finds voltage across Z2 which is euqal to the voltage across R2
VZ2m=abs(VZ2)
VZ2ph=angle(VZ2)




