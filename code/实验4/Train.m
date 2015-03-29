%在训练集/测试集上训练,返回错误率
function err = Train(Dtest,Dtrain,k)
err = 0;
[len h] = size(Dtrain);
%对于训练集,前45个样本属于类1
for i=1:len/2
    distance = pdist2(Dtest,Dtrain(i,:),'Euclidean');%计算欧式距离
    dis = sort(distance,1,'ascend');%按照行进行升序排列
    idex = zeros(k,1);
    
    for j=1:k
        idex(j,1) =find(distance == dis(j,1));
    end
    if sum(idex > 10) > k/2.0 %该样本分错
        err = err +1;
    end
end

%对于训练集,后45个样本属于类2
for i=len/2 + 1:len
    distance = pdist2(Dtest,Dtrain(i,:),'Euclidean');%计算欧式距离
    dis = sort(distance,1,'ascend');%按照行进行升序排列
    idex = zeros(k,1);
    
    for j=1:k
        idex(j,1) =find(distance == dis(j,1));
    end
    if sum(idex < 10) > k/2.0 %该样本分错
        err = err +1;
    end
end
err = err/len;