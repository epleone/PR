%DPDR函数的重建误差,train为训练集，test为测试集，power为PCA降维的能量比，reErr为重建误差
function reErr = PCAerr(train,test,power,f)
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

%-------------------------------计算重建误差-------------------------------%
label = ones(1,5);
for i=2:40
   label =[label,ones(1,5)*i]; %每一类的标记，也就是在训练集上的测试效果
end

pTrain = w'*train;
pTest = w'*test;
y = zeros(200,1);%输出结果，用来构造投影矩阵M*train' = y;
for i=1:200
    dis = pdist2(pTrain',pTest(:,i)');
    idex = find(dis == min(dis));
    y(i) = idex;
end
M = label*pinv(pTrain);%%投影矩阵
reSet = pinv(M)*y';%%获得重建的矩阵
reErr = norm(reSet-pTest)/(norm(reSet)+norm(pTest));


if nargin == 4 && f==1
    M = [label,y']*pinv([pTrain,pTest]);%%投影矩阵
    reSet = pinv(M)*y';%%获得重建的矩阵
    reErr = norm(reSet-pTest)/(norm(reSet)+norm(pTest));
end