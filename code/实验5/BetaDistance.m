%�����Ķ�������
function dis = BetaDistance(data,center,beta)
dis = pdist2(data,center,'Euclidean').^2;%ŷʽ���������ƽ��
dis = 1-exp(-beta.*dis);