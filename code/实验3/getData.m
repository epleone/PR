%����100��ÿ��n�������ݼ�,ȡ10����100
function [xdata,ydata]=getData(n)
xdata = zeros(100,n);%��ʼ��
ydata = xdata;
for i=1:100
    %x = linspace(-1,1,n);%x�Ǿ��ȷֲ�������
    x = 2 * rand(1, n) - 1;
    y=x.^2+sqrt(0.1)*rand(1,n);%y=x*x���Ϸ���Ϊ0.1�ĸ�˹����
    xdata(i,:) = x;
    ydata(i,:) = y;
end