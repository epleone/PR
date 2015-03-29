%给定的度量函数
function dis = BetaDistance(data,center,beta)
dis = pdist2(data,center,'Euclidean').^2;%欧式距离度量的平方
dis = 1-exp(-beta.*dis);