clc; clear all;
 
load('InputSignal.mat')       %noisy input signal
 
Ifft=fft(signal);
Imagsq=(abs(Ifft)).^2;
I0=mean(Ifft(1:10));
I0magsq=(abs(I0))^2;
 
v=var(signal);
avg=mean(signal);
 
i1=v/avg;                       %amplitude
 
Np=avg^2/v;
 
tau=.07;
lambda=Np/tau;
w=1:1001;
Itest=I0magsq./(1+(tau.*w).^2);
 
 
loglog(w,Itest,w,Imagsq)
