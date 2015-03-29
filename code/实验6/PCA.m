%PCA函数,train为训练集，test为测试集，power为PCA降维的能量比，err为分类正确率
function err=PCA(train,test,power)
%-------------------------得到散布矩阵，p95 式84----------------------------%
tmean = mean(train,2); %测试集的均值,这种算均值的方法是不好的，但是按行算，会内存溢出
ts = (train - repmat(tmean,1,200))'*(train - repmat(tmean,1,200));%测试集的散布矩阵


%------------------------------算出方向向量w-------------------------------%
%用matlab自带的PCACOV函数对散布矩阵做矩阵分解
[p,la,exp] = PCACOV(ts);

for i=1:200
    if(sum(exp(1:i,:)) > power); %当能量占到power%时，退出
        id = i;
        break;
    end
end
w = pinv(train')*p(:, 1:id);

%---------------------------------降维-------------------------------------%
pTrain = w'*train;%训练集
pTest = w'*test;%测试集
err = 0;%正确的数量

%----------------------------------分类------------------------------------%
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

