clc
clear all
format compact

% mili=e-3  micro=e-6  nano=e-9  pico=e-12 

%input data 
Vs=34*exp(j*0.25);
f=18e6;
omega=2*pi*f;
Zi=295-j*200

%finding matching load impedance
Zml=conj(Zi);
Zml_real=real(Zml)
Zml_imag=imag(Zml)

%finding average power
Itotal=Vs/(Zi + Zml);
Irms=Itotal/sqrt(2);
Vrms=Vs/sqrt(2);
S=Vrms*Irms*cos(angle(Vs)-angle(Itotal));
Pavg=real(S)
Q=abs(imag(S))

%finding inductance of equivalent circuit
Xml=imag(Zml);
Lml=Xml/omega

%%%%%%%%%%%%%%% MATLAB OUTPUT %%%%%%%%%%%%%%%%%
% Zi =
%    2.9500e+02 - 2.0000e+02i
% Zml_real =
%    295
% Zml_imag =
%    200
% Pavg =
%     0.8597
% Q =
%     0.4697
% Lml =
%    1.7684e-06
