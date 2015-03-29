%算法10 最小平方误差算法，学习率取1/k
function errNum = LMS(trainData,testData)

w = [0.1,0,0,0,0];%w是增广权向量，为n+1维
b = ones(1,50);%裕量
k=0;
jp = [1,1,1,1,1];
max = 10000;%最大迭代次数
idex =1;
%----------------------训练出W-------------------------%
while (norm(jp) > 0.00001) && (idex < max) %不满足条件
     idex = idex +1;
     k=mod(k+1,50);
     
     if k==0;
          k=50;
     end;
     
     jp=(1/idex)*(b(k)-w*trainData(k,:)')*trainData(k,:);%增量
     w=w+jp;
     w=w/norm(w);%归一化
 
    if(idex == max)
        disp('算法10运行超过最大迭代次数!!');
    end
end

%---------------------计算在测试集的正确率----------------------%
 errNum = 1-length(find((testData*w')<0))/50;