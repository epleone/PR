%算法3，批处理感知器算法;学习率取1/k;
function errNum = BatchPerceptron(trainData,testData)
%先用训练集训练参数w

w = [0.1,0,0,0,0]';%w是增广权向量，为n+1维

m=find( (trainData*w) < 0 );%求出分错的数据
err = trainData(m,:);%分错的数据
err = sum(err,1);
jp = dot(err,err);%代价函数
max = 10000;%最大迭代次数
idex =1;
%----------------------训练出W-------------------------%
while (jp>0.0001) && (idex < max) %不满足条件
    idex = idex +1;
    deta = (1/idex)*err;
    w = w + deta';
    m=find( (trainData*w) < 0 );%求出分错的数据
    err = trainData(m,:);%分错的数据
    err = sum(err,1);
    jp = sqrt(dot(deta,deta));%代价函数
    
    if(idex == max)
        disp('算法3运行超过最大迭代次数!');
    end
end

%---------------------计算在测试集的正确率----------------------%
 errNum = 1-length(find((testData*w)<0))/50;

