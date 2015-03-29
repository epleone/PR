%算法9，单样本裕量松弛算法;学习率取1/k;
function errNum = SinSamRelaxationWithMargin(trainData,testData)

w = [0.1,0,0,0,0]';%w是增广权向量，为n+1维
b = 0.01;%裕量，此处取0.01
m=find( (trainData*w) < -b );%求出分错的数据
err = trainData(m,:);%分错的数据
[jp temp]= size(err);%分错的数量
max = 10000;%最大迭代次数
idex =1;
%----------------------训练出W-------------------------%
while (jp > 0) && (idex < max) %不满足条件
    idex = idex +1;
    
    for i=1:jp
        y = err(i,:);
        w = w + (1/idex)*(b-y*w)*y'/dot(y,y);
    end
    
    m=find( (trainData*w) < -b );%求出分错的数据
    err = trainData(m,:);%分错的数据
    [jp temp] = size(err);%分错的数量
    
    if(idex == max)
        disp('算法9运行超过最大迭代次数!!');
    end
    
end

%---------------------计算在测试集的正确率----------------------%
 errNum = 1-length(find((testData*w)<0))/50;