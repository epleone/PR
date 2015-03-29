%返回最大似然估计的值,第一题第二问所用函数,即二维情况下
function [E,S]=MLValue2D(x,x1)
len = length(x);
E1 = mean(x);
E2 = mean(x1);
E = [E1,E2];
%m = [x',x1'];%数据矩阵
S = cov(x',x1')*(len-1)/len;%用cov函数算出来的协方差是无偏估计,除以n-1,再乘上n-1/n，可以得到ML估计