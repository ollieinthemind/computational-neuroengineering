%dennis mcilhany
 
clc; clear all;
 
%normal conditions
 
lambda=0.4;
u=1.2;
dev=0.1;
 
for m=1:4;
    P(m)=exp(-lambda)*(lambda^(m-1))/(factorial(m-1));
end
 
V=zeros(1,1000);
k=1;
failure=0;
single=0;
double=0;
triple=0;
while k<1001;
    r=rand(1,1);
    if r<=P(1);
        V(k)=0;
        k=k+1;
        failure=failure+1;
    elseif r>P(1) && r<=P(1)+P(2);
        V(k)=u+dev.*randn(1,1);                         %one vesicle release
        k=k+1;
        single=single+1;
    elseif r>P(1)+P(2) && r<=P(1)+P(2)+P(3);
        V(k)=u+dev.*randn(1,1)+u+dev.*randn(1,1);       %two vesicle release
        k=k+1;
        double=double+1;
    elseif r>P(1)+P(2)+P(3) && r<=1;
        V(k)=u+dev.*randn(1,1)+u+dev.*randn(1,1)+u+dev.*randn(1,1);       %three vesicle release
        k=k+1;
        triple=triple+1;
    end
end
g=mean(V);
 
 
 
%lambda altered condition
 
lambda2=0.7;
u=1.2;
dev=0.1;
h=0;
while abs(g-h)>=.01;
    u=u-.01;
    for m=1:4;
        P(m)=exp(-lambda2)*(lambda2^(m-1))/(factorial(m-1));
    end
    
    V2=zeros(1,1000);
    k=1;
    failure=0;
    single=0;
    double=0;
    triple=0;
    while k<1001;
        r=rand(1,1);
        if r<=P(1);
            V2(k)=0;
            k=k+1;
            failure=failure+1;
        elseif r>P(1) && r<=P(1)+P(2);
            V2(k)=u+dev.*randn(1,1);                         %one vesicle release
            k=k+1;
            single=single+1;
        elseif r>P(1)+P(2) && r<=P(1)+P(2)+P(3);
            V2(k)=u+dev.*randn(1,1)+u+dev.*randn(1,1);       %two vesicle release
            k=k+1;
            double=double+1;
        elseif r>P(1)+P(2)+P(3) && r<=1;
            V2(k)=u+dev.*randn(1,1)+u+dev.*randn(1,1)+u+dev.*randn(1,1);       %three vesicle release
            k=k+1;
            triple=triple+1;
        end
    end
    h=mean(V2);
end
hist(V2,30)
xlabel('Amplitude of end-plate potentials (mV)')
ylabel('Observations')

