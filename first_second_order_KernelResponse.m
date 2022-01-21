 
e1=-50;
e2=20;
g1=130;
C=2;
IC=-15;
seed=4;
g2st=500;
g2v=g2st^2;
P=g2v;
g2m=130;
 
tau_vect=[0 5 10 20 40];
 
sim('lab3_2s');
 
shift=100;
g2=g2.signals.values;
Vt=V.signals.values;
Vn=Vt(1:length(g2));
V=Vn(shift:end);
 
 
wk0=mean(V);
 
wk1=zeros(length(tau_vect),1);
for tau=1:length(tau_vect);
    g2s(tau,:)=zeros(1,length(V));
    g2s(tau,:)=g2(shift-tau_vect(tau):end-tau_vect(tau));
    wk1(tau)=1/P*dot(V,(g2s(tau,:)-mean(g2)));
end
figure(1)
plot(tau_vect,wk1)
xlabel('Tau');
ylabel('Response')
title('First Order Kernel Response')
 
wk2=zeros(length(tau_vect),length(tau_vect));
for tau1=1:length(tau_vect);
    for tau2=1:length(tau_vect);
        g2s1(tau1,:)=g2(shift-tau_vect(tau1):end-tau_vect(tau1));
        g2s2(tau2,:)=g2(shift-tau_vect(tau2):end-tau_vect(tau2));
        if tau1==tau2;
            wk2(tau1,tau2)=1/(2*P^2)*mean(((V'-wk0).*(g2s1(tau1,:)-mean(g2)).*(g2s2(tau2,:)-mean(g2))));
        else
            wk2(tau1,tau2)=1/(2*P^2)*mean(((V'.*(g2s1(tau1,:)-mean(g2)).*(g2s2(tau2,:)-mean(g2)))));
        end
    end
end
 
X=tau_vect;
Y=X;
figure(2)
mesh(X,Y,wk2)
xlabel('Tau');
ylabel('Tau');
zlabel('Response')
title('Second Order Kernel Response')
