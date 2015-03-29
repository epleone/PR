%返回最大似然估计的值,第一题第一问所用函数,即一维情况下
function [E,S]=MLValue(x)
%len = length(x);
E = mean(x);
S = var(x,1); %var函数是除以n
%S = sum((x(1,:)-E).^2)/len;
