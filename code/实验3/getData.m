%产生100组每组n个的数据集,取10或者100
function [xdata,ydata]=getData(n)
xdata = zeros(100,n);%初始化
ydata = xdata;
for i=1:100
    %x = linspace(-1,1,n);%x是均匀分布产生的
    x = 2 * rand(1, n) - 1;
    y=x.^2+sqrt(0.1)*rand(1,n);%y=x*x加上方差为0.1的高斯噪声
    xdata(i,:) = x;
    ydata(i,:) = y;
end