%���������Ȼ���Ƶ�ֵ,��һ���һ�����ú���,��һά�����
function [E,S]=MLValue(x)
%len = length(x);
E = mean(x);
S = var(x,1); %var�����ǳ���n
%S = sum((x(1,:)-E).^2)/len;
