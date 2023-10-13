clc
clear all
format compact

%input data
clc
clear all
format compact
%input data
Vs=1;
R1=200;
R2=150;
C=3e-6;
L=5e-3;
fmin=100; fmax=12000; %we define the start and end frequencies
df=100; % the frequency step 
nf=(fmax-fmin)/df+1; % the required number of frequency steps 
for n=1:nf; % start of frequency loop; n is a counter
f=fmin+df*n; % f takes the value of fmin +(frequency step) * (loop number)
om=2*pi*f;
ZL=j*om*L; %regular nodal analysis block. Note that om is a single number
ZC=-j/(om*C);
% Y=[1/R1+1/ZL,0,0;...
%    0, 1/ZC, 0;...
%    0, 0, 1/R2];
% Is=[Vs/R1;0;0];
% F=Y\Is;
% Vout=F(2);
Ztotal=R1+1/(1/ZL+1/ZC+1/R2);
Is=Vs/Ztotal;
Vout=Is/Ztotal;
H=Vout/Vs;
M(n)=abs(H); % accumulating M array
MdB(n)=20*log10(M(n)); % accumulating MdB array
Ph_deg(n)=angle(H)*180/pi; % accumulating Phase array
% We also need to remember the f values by accumulating them in f_plt array
f_plt(n)=f; % f_plt array (f value changes every time loop counter increases)
 end % after the end of the loop we have arrays of f_plt, M, MdB and Phase 
figure(1)
semilogx(f_plt,MdB)
title('M, dB')
xlabel('f, Hz')
grid on
figure(2)
semilogx(f_plt,Ph_deg)
title('Phase, deg')
xlabel('f, Hz')
grid on
% Vs=1;
% R1=200;
% R2=150;
% C=3e-6;
% L=5e-3;
% fmin=100;
% fmax=12000;
% df=100;
% nf=(fmax-fmin)/df+1;
% for n=1:nf;
%     f=fmin+df*n;
%     omega=2*pi*f;
%     ZL=j*omega*L;
%     ZC=-j/(omega*C);
%     %nodal analysis
% %     Y=[1/R1+1/ZL, 0, 0;...
% %        0, 1/ZC, 0;...
% %        0, 0, 1/R2];
% %    Is=[Vs/R1;...
% %        0;...
% %        0];
%    %F=Y\Is;
%    Y=R1+1/((1/ZL)+(1/ZC)+(1/R2));
%    Is=Vs/R1;
%    Vout=Is/Y
%    H=Vout/Vs;
%    M(n)=abs(H);
%    MdB=20*log10(M(n));
%    ph_deg(n)=angle(H)*180/pi;
%    f_plt(n)=f
% end
% figure(1)
% semilogx(f_plt,MdB)
% title('M, dB')
% xlabel('f, Hz')
% grid on
% figure(2)
% semilogx(f_plt,ph_deg)
% title('Phase, deg')
% xlabel('f, Hz')
% grid on
   