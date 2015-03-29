%fisher 判别函数 
%由w=S^(-1)(m1-m2)可以得到判别方向
function w =FLDA(w1,w2)
m1 = mean(w1);
m2 = mean(w2);
[len1,h1]=size(w1);
[len2,h2]=size(w2);

s1 = cov(w1)*(len1-1);%散布矩阵是样本协方差矩阵无偏估计的n-1倍
s2 = cov(w2)*(len2-1);

w = inv(s1+s2)*(m1'-m2'); 
