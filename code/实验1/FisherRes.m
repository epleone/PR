%实验1第二题的结果
function FisherRes()
clc;clear;
%W2的数据
x1=[-0.4,-0.31,0.38,-0.15,-0.35,0.17,-0.011,-0.27,-0.065,-0.12];
x2=[0.58,0.27,0.055,0.53,0.47,0.69,0.55,0.61,0.49,0.054];
x3=[0.089,-0.04,-0.035,0.011,0.034,0.1,-0.18,0.12,0.0012,-0.063];
w2=[x1',x2',x3'];
%W3的数据
y1=[0.83,1.1,-0.44,0.047,0.28,-0.39,0.34,-0.3,1.1,0.18];
y2=[1.6,1.6,-0.41,-0.45,0.35,-0.48,-0.079,-0.22,1.2,-0.11];
y3=[-0.014,0.48,0.32,1.4,3.1,0.11,0.14,2.2,-0.46,-0.49];
w3=[y1',y2',y3'];

%------------------------------求w---------------------------------%
w = FLDA(w2,w3);
fprintf('由fisher线性判别计算出来的最优方向为:\n')
w

%-------------------------------画图--------------------------------%
x = -5:5;
x1 = w(1)*x;
x2 = w(2)*x;
x3 = w(3)*x;
figure(3);
plot3(x1,x2,x3,'k');
hold on  %在原图的基础上继续添加元素
wor = orth(w);%将w正交化
w2s = wor*(wor'*w2');%得到在w方向上的投影
w3s = wor*(wor'*w3');

plot3(w2(1,:),w2(2,:),w2(3,:),'b*');%w2的点
plot3(w2s(1,:),w2s(2,:),w2s(3,:),'r*');%w2投影后的点

plot3(w3(1,:),w3(2,:),w3(3,:),'g.');%w3的点
plot3(w3s(1,:),w3s(2,:),w3s(3,:),'k.');%w3投影后的点
grid;
hold off;%结束

%用高斯函数拟合
w2l = w2*w;%W2投影后的点
w3l = w3*w;
[E2,S2]=MLValue(w2l);
[E3,S3]=MLValue(w3l);

x=-0.5:0.01:0.5;
y2=exp(-(x-E2).^2/(2*S2))/sqrt(2*pi*S2);
y3=exp(-(x-E3).^2/(2*S3))/sqrt(2*pi*S3);
figure(1);
plot(x,y2,'-k','color','blue');
hold on;
grid;
plot(x,y3,'-k','color','green');
plot(w2l,0,'b*','MarkerSize',6);
plot(w3l,0,'g.','MarkerSize',6);

%求分类面，书上P32
p2=S3-S2;
p1=-2*(S3*E2-S2*E3);
p0=S3*E2^2-S2*E3^2-S2*S3*log(S3/S2);
p=[p2 p1 p0];
r=roots(p);

for i=1:length(r)
    if r(i)<max(E2,E3) && (r(i)>min(E2,E3)) %分类面应在两者均值之间
        x=r(i);
    end
end
plot(x,0:0.01:5,'--r');
hold off;

%计算误差
count = 0;
for i=1:length(w2l)
    if(w2l(i) < x)
        count = count+1;
    end
    if(w3l(i) > x)
        count = count+1;
    end
end
err = count /20;

fprintf('fisher条件下最优w分类面为 x=%f\n',x);
fprintf('fisher条件下最优w下误差率为%f\n',err);

%--------------------------画图(非最优w)------------------------------%
w = [1.0,2.0,-1.5]';
%用高斯函数拟合
w2l = w2*w;%W2投影后的点
w3l = w3*w;
[E2,S2]=MLValue(w2l);
[E3,S3]=MLValue(w3l);

x=-6:0.1:6;
y2=exp(-(x-E2).^2/(2*S2))/sqrt(2*pi*S2);
y3=exp(-(x-E3).^2/(2*S3))/sqrt(2*pi*S3);

figure(2);
plot(x,y2,'-k','color','blue');
hold on;
grid;
plot(x,y3,'-k','color','green');
plot(w2l,0,'b*','MarkerSize',6);
plot(w3l,0,'g.','MarkerSize',6);

%求分类面，书上P32
p2=S3-S2;
p1=-2*(S3*E2-S2*E3);
p0=S3*E2^2-S2*E3^2-S2*S3*log(S3/S2);
p=[p2 p1 p0];
r=roots(p);

for i=1:length(r)
    if r(i)<max(E2,E3) && (r(i)>min(E2,E3)) %分类面应在两者均值之间
        x=r(i);
    end
end
plot(x,0:0.001:1.1,'--r');
hold off;

%计算误差
count = 0;
for i=1:length(w2l)
    if(w2l(i) < x)
        count = count+1;
    end
    if(w3l(i) > x)
        count = count+1;
    end
end
err = count /20;

fprintf('fisher条件下非最优w的分类面为 x=%f\n',x);
fprintf('fisher条件下非最优w下误差率为%f\n',err);

