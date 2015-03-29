%返回最大似然估计的值,第一题第三问所用函数,即三维情况下
function [E,S]=MLValue3D(x,x1,x2)
len = length(x);
E1 = mean(x);
E2 = mean(x1);
E3 = mean(x2);
E = [E1,E2,E3];
m = [x',x1',x2'];
S = cov(m)*(len-1)/len;%用cov函数算出来的协方差是无偏估计,除以n-1,再乘上n-1/n，可以得到ML估计