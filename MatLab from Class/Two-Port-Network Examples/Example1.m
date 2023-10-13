clc
clear all
format compact
Vn=1;
C=3e-12;
R=50;
f=1e6: 1e6: 10e9;
omega=2*pi*f;
ZC=-j./(omega*C);
ZTotal=ZC+R;
I=Vn./ZTotal;  % omega is in ZTotal so use ./
Vout=I*R;
H=Vout/Vn;
M=abs(H);
MdB = 20*log10(M);
%plotting graph

figure(1)
semilogx(f,MdB)
grid on;
xlabel('Frequency Hz');
ylabel('Magnitude dB');