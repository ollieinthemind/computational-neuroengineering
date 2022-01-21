clc; clear all;
 
lambda=10;
sigma=5;
 
irand=randi(10,1,10);
jrand=randi(10,1,10);
 
X=zeros(10,1);
Y=X;
dist=zeros;
VX=zeros(10,10);
VY=VX;
Tsum=VX;
 
for i=1:length(jrand);
    xpos=irand(i);
    ypos=jrand(i);
    Y(i)=rand(1,1);
    X(i)=-1+2*rand(1,1);
    VX(xpos,ypos)=Y(i);
    VY(xpos,ypos)=X(i);
end
 
Ysum=sum(Y);
Xsum=sum(X);
quiver(5,5,Xsum,Ysum)
hold on
quiver(VX,VY)
hold on
 
for i=1:length(jrand);
    for j=1:length(jrand);
        dist(i,j)=sqrt((irand(i)-irand(j))^2+(jrand(i)-jrand(j))^2);
        if i==j;
            delt=1;
        else
            delt=0;
        end
        AB(i,j)=lambda.*delt+(1/(2*pi*sigma^2))*exp(-dist(i,j)^2/(2*sigma^2));
    end
end
 
Bx=inv(AB)*X;
By=inv(AB)*Y;
 
Vx=zeros(10,10);
Vy=Vx;
 
for i=1:length(jrand);
    for j=1:length(irand);
        for k=1:length(irand);
            Vx(j,k)=Vx(j,k)+Bx(i)/(2*pi*sigma^2)*exp(-((sqrt((j-(irand(i)))^2+(k-(jrand(i)))^2))^2)/(2*sigma^2));
            Vy(j,k)=Vy(j,k)+By(i)/(2*pi*sigma^2)*exp(-((sqrt((j-(irand(i)))^2+(k-(jrand(i)))^2))^2)/(2*sigma^2));
        end
    end
end
 
quiver(Vx,Vy)

