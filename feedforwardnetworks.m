clc; clear all;
 
sig=10;
% sopt=-20;
% gopt=10;
% s=-40:40;
% g=-40:40;
% l=length(s);
% f=zeros(l,l);
% 
% for n=1:l;
%     for k=1:l;
%         f(n,k)=exp(-(s(n)-sopt).^2./(2.*sig^2)).*exp(-(g(k)-gopt).^2./(2*sig^2));
%     end
% end
% mesh(s,g,f);
% xlabel('g (Degrees)')
% ylabel('s (Degrees)')
% zlabel('Firing Rate (%Max)')
% title('Neuron Firing for Different Angles of Gaze and Visual Angle')
 
 
s=-150:10:150;
g=-150:10:150;
sopt=-150:10:150;
gopt=-150:10:150;
l=length(s);
out=zeros(l,l);
f=zeros(l,l);
WK=eye(l);
WN=flipud(WK);
for q=1:l;
    for p=1:l;
        for n=1:l;
            for k=1:l;
                f(n,k)=exp(-(s(q)-sopt(n)).^2./(2.*sig^2)).*exp(-(g(p)-gopt(k)).^2./(2*sig^2));
            end
            out(q,p)=mean(dot(f,WN));
        end
    end
end
mesh(s,g,out)
xlabel('g (Degrees)')
ylabel('s (Degrees)')
zlabel('Firing Rate (%Max)')


