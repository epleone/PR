%��ѵ����/���Լ���ѵ��,���ش�����
function err = Train(Dtest,Dtrain,k)
err = 0;
[len h] = size(Dtrain);
%����ѵ����,ǰ45������������1
for i=1:len/2
    distance = pdist2(Dtest,Dtrain(i,:),'Euclidean');%����ŷʽ����
    dis = sort(distance,1,'ascend');%�����н�����������
    idex = zeros(k,1);
    
    for j=1:k
        idex(j,1) =find(distance == dis(j,1));
    end
    if sum(idex > 10) > k/2.0 %�������ִ�
        err = err +1;
    end
end

%����ѵ����,��45������������2
for i=len/2 + 1:len
    distance = pdist2(Dtest,Dtrain(i,:),'Euclidean');%����ŷʽ����
    dis = sort(distance,1,'ascend');%�����н�����������
    idex = zeros(k,1);
    
    for j=1:k
        idex(j,1) =find(distance == dis(j,1));
    end
    if sum(idex < 10) > k/2.0 %�������ִ�
        err = err +1;
    end
end
err = err/len;