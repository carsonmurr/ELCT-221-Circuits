clc
clear all
format compact
%Kilo(K), Mega(M), Giga(G), Tera(T)
%milli(m), micro(u), nano(n), pico(p)
Vs=2; 
R=100;
C=0.1e-6;
f=20e3;
om=2*pi*f;
ZC=-j/(om*C);
%Matrices
Y=[1/R+1/ZC];
Is=[Vs/R];
V=Y\Is;
%V amplitude & phase angle
Vm=abs(V);  %output voltage
Vph=angle(V);
%Current through circuit
I=Vs/(R+ZC);
Im=abs(I);
%Voltage through R
Vr=I*R;
Vrm=abs(Vr);
%Voltage through C
Vc=Vs-Vr;
disp("Theoretical results:")
Vcm_theoretical=abs(Vc)
Vcph_theoretical=angle(Vc)
disp("----------------------------------")


%----------Comparing to experimental vlaues--------------------------
disp("Experimental Results")
%Experimental voltage amplitude
Vcm_experimental=1.24
%calculate experimental phase shift in radians
deltaT=7.03e-6  %time delay between waves
Vcph_experimental=(-1*360*f*deltaT*pi)/(180)  %times negative 1 since the output voltage is leading