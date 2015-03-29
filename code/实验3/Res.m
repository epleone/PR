%ʵ���������н��,n��ʾÿ�����ݵĴ�С,�ֱ�Ϊ10����100
function Res(n)
%clc;
if nargin == 0
  n = 10; %%Ĭ�ϲ�������10
end
%�������ݼ�
[x y] = getData(n);
bias = zeros(100,1);
variame =bias;
%F(x) = x^2
%------------------------����g(x) =0.5-------------------------------%
bias = mean(0.5-x.^2,2);%��g(x) =0.5��˵������=0.5��
variame = 0*variame;%��g(x) =0.5��˵������=0��
Error = bias.^2 + variame;%�������
fprintf('n=%d,g(x)=0.5ʱ,ƫ���ֵΪ��%f\t�����ֵΪ��%f\n',n,mean(bias,1),mean(variame,1));
figure(1);
hist(Error);
title('g(x)=0.5ʱ�ľ������ֱ��ͼ');
figure(11);
xb=1:100;
plot(xb,bias,'r+ -',xb,variame,'k* :');
legend('Bias','Variame',1); 
title('g(x)=0.5ʱ ƫ��ͷ���ı仯����');

%------------------------����g(x) =1.0-------------------------------%
bias = mean(1.0-x.^2,2);%��g(x) =1.0��˵������=1.0��
variame = 0*variame;%��g(x) =0.5��˵������=0��
Error = bias.^2 + variame;%�������
fprintf('n=%d,g(x)=1.0ʱ,ƫ���ֵΪ��%f\t�����ֵΪ��%f\n',n,mean(bias,1),mean(variame,1));
figure(2);
hist(Error);
title('g(x)=1.0ʱ�ľ������ֱ��ͼ');
figure(21);
plot(xb,bias,'r+ -',xb,variame,'k* :');
legend('Bias','Variame',1); 
title('g(x)=1.0ʱ ƫ��ͷ���ı仯����');

%------------------------����g(x)=a0+a1*x-------------------------------%
%������LSE�㷨������ŵ�a0 a1��ֵ
a = zeros(100,2);%Ҫ��Ĳ���
gx = zeros(100,n);%����Ļع鷽��������õ���ֵ
for i = 1:100
      a(i, :) = polyfit(x(i,:), y(i,:), 1);%matlab�Դ������Իع麯��
      for j = 1:n
        gx(i,j)=a(i,2)+a(i,1)*x(i,j);
      end
end

bias = mean(gx-x.^2,2);%ƫ�
for i=1:100
   variame(i) = var(gx(i,:),1);%��� 
end
Error = bias.^2 + variame;%�������
fprintf('n=%d,g(x)=a0 + a1*xʱ,ƫ���ֵΪ��%f\t�����ֵΪ��%f\n',n,mean(bias,1),mean(variame,1));
figure(3);
hist(Error);
title('g(x)=a0 + a1*x ʱ�ľ������ֱ��ͼ');
figure(31);
plot(xb,bias,'r+ -',xb,variame,'k* :');
legend('Bias','Variame',1); 
title('g(x)=a0 + a1*xʱ ƫ��ͷ���ı仯����');

%------------------����g(x)=a0+a1*x+a2*x^2+a3*x^3----------------------%
%������LSE�㷨������ŵ�a0 a1 a2 a3��ֵ
a = zeros(100,4);%Ҫ��Ĳ���
gx = zeros(100,n);%����Ļع鷽��������õ���ֵ
for i = 1:100
      a(i, :) = polyfit(x(i,:), y(i,:), 3);%matlab�Դ������Իع麯��
      for j = 1:n
        gx(i,j)=a(i,4)+a(i,3)*x(i,j)+a(i,2)*x(i,j)^2+a(i,1)*x(i,j)^3;
      end
end

bias = mean(gx-x.^2,2);%ƫ�
for i=1:100
   variame(i) = var(gx(i,:),1);%��� 
end
Error = bias.^2 + variame;%�������
fprintf('n=%d,g(x)=a0+a1*x+a2*x^2+a3*x^3ʱ,ƫ���ֵΪ��%f\t�����ֵΪ��%f\n',n,mean(bias,1),mean(variame,1));
figure(4);
hist(Error);
title('g(x)=a0+a1*x+a2*x^2+a3*x^3 ʱ�ľ������ֱ��ͼ');
figure(41);
plot(xb,bias,'r+ -',xb,variame,'k* :');
legend('Bias','Variame',1); 
title('g(x)=a0+a1*x+a2*x^2+a3*x^3ʱ ƫ��ͷ���ı仯����');
