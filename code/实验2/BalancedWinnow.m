%算法7，平衡winnow算法
function errNum = BalancedWinnow(trainData,testData)

trainData(find(trainData<0)) = -trainData(find(trainData<0));%数据预处理
testData(find(testData<0)) = -testData(find(testData<0));

wp = [1,1,1,1,1]'/2;;%正的权向量
wm = -wp;%负的权向量
alpha = 3;%可以调整的值，alpha>1

len = 1;
max = 10000;
idex = 1;

while len>0 && idex < max
    idex = idex+1;
    
    for i=1:50
        
        d = trainData(i,:)*wp - trainData(i,:)*wm;
        if (d) < 0 %表示分错
        
            if i<26 %class1 分错
                for j=1:5
                    y = trainData(i,j);
                    wp(j) = alpha^y*wp(j);
                    wm(j) = alpha^(-y)*wm(j);
                end
            end
            
            if i>25 %class2 分错
                for j=1:5
                    y = trainData(i,j);
                    wm(j) = alpha^y*wm(j);
                    wp(j) = alpha^(-y)*wp(j);
                end
            end
        end
        
    end
    
    m=find( (trainData*wp -trainData*wm) < 0 );%求出分错的数据
    len = length(m);
    
    if(idex == max)
        disp('算法7运行超过最大迭代次数!');
    end
end

%---------------------计算在测试集的正确率----------------------%
 errNum = 1-length(find((testData*wp-testData*wm)<0))/50;
 
 