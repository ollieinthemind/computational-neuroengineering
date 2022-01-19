clc; clear all;
 
tau=10;
W=zeros(10,5);
MN=zeros(10,10);
MK=MN;
u=zeros(1,5);
for i=1:10;
    for j=1:5;
        u(j)=6-j;
        W(i,j)=exp(-(i - 2*j)^2);
        for k=1:10;
        if k==i;
            MN(k,i) = -(k+i);
            MK(k,i) = -(k+i)+0.5;
        else
            MN(k,i) = -0.5*(k+i);
            MK(k,i) = -0.5*(k+i);
        end
        end
    end
end
 
[eN VN]=eig(MN);
[eK VK]=eig(MK);
LN=diag(VN);
LK=diag(VK);
 
 
h=W*u';
t=0:1000;
VN=zeros(length(t),10);
VK=VN;
cnuN=zeros(1,10);
cnuK=cnuN;
c0=0;
 
for z=1:length(t);
    for nu=1:10;
        cnuN(nu)=(dot(eN(:,nu),h)/(1-LN(nu)))*(1-exp((-(t(z)*(1-LN(nu)))/tau))+c0*exp((-t(z)*(1-LN(nu)))));
        VN(z,:)=cnuN(nu)*eN(nu)+VN(z,:);
        cnuK(nu)=(dot(eK(:,nu),h)/(1-LK(nu)))*(1-exp((-(t(z)*(1-LK(nu)))/tau))+c0*exp((-t(z)*(1-LK(nu)))));
        VK(z,:)=cnuK(nu)*eK(nu)+VK(z,:);
    end
    cnuN=zeros(1,10);
    cnuK=cnuN;
end
figure(1)
plot(t,VK)
title('Nuclei Response Unstable')
xlabel('Time (ms)')
ylabel('Ouput')
figure(2)
plot(t,VN)
title('Normal Nuclei Response')
xlabel('Time (ms)')
ylabel('Ouput')

