%���������Ȼ���Ƶ�ֵ,��һ����������ú���,����ά�����
function [E,S]=MLValue3D(x,x1,x2)
len = length(x);
E1 = mean(x);
E2 = mean(x1);
E3 = mean(x2);
E = [E1,E2,E3];
m = [x',x1',x2'];
S = cov(m)*(len-1)/len;%��cov�����������Э��������ƫ����,����n-1,�ٳ���n-1/n�����Եõ�ML����