clc; clear all;
 
qs=1;
qd=0;
Q=[qs qd;qd qs];
 
s1=1;
s2=32; 
 
for i=1:512;
    for j=1:512;
        K(i,j)=exp(-(i-j)^2/(2*s1^2))/s1^2-exp(-(i-j)^2/(2*s2^2))/s2^2;
    end
end
mesh(K)
 
WMat=randn(512,2);
WV=reshape(WMat, 1024,1);
 
 
ts=[0 100];
 
[t w]=ode45(@lrnfnc,ts,WV,[],K,Q);
wL=w(:,1:512);
wR=w(:,513:1024);
dom= wR > wL;
imshow(dom)



%The calling function for ode45


function dw = lrnfnc(t,w,K,Q)
 
tau = 1;
w2=reshape(w,512,2);
dw2 = (K*w2*Q)/tau;
dw=reshape(dw2,1024,1);
 
 
