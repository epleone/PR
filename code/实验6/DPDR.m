%DPDR函数，,train为训练集，test为测试集， err为分类正确率,使用QR分解
function err =DPDR(train,test)
%--------------------------避免维数灾难，先用PCA降维-----------------------%
tmean = mean(train,2); %训练集的均值
ts = (train - repmat(tmean,1,200))'*(train - repmat(tmean,1,200));%训练集的散布矩阵
[p,la,exp] = PCACOV(ts);
for i=1:200
    if(sum(exp(1:i,:)) > 85); %当能量占到85%时，退出
        id = i;
        break;
    end
end
w = pinv(train')*p(:, 1:id);
train = w'*train;%降维后训练集
test = w'*test;%降维后测试集
err = 0;%正确的数量

%-------------------------------QR分解---------------------------------%
[Q R] = qr(train); %不采用PCA降维，则内存溢出。。

%----------------------------------分类------------------------------------%
pTrain = Q'*train;
pTest = Q'*test;

for i=1:200
    dis = pdist2(pTrain',pTest(:,i)');
    idex = find(dis == min(dis));

    %判断是否分对    
    if(abs(i-idex)<5) %首先要小于5
        if mod(idex,5) < 5  && mod(i,5) < 5
            err = err+1;
        elseif mod(idex,5) > 5  && mod(i,5) > 5
            err = err+1;
        end
    end
end

err = err/200.0;%正确率
