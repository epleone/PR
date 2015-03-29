%算法12 Modified Ho-Kashyap算法，学习率取1/k
function errNum = MHK(trainData,testData)

w = [0.1,0,0,0,0];%w是增广权向量，为n+1维
b = ones(1,50);%裕量
e = b;
Kmax = 10000;%最大迭代次数
Bmin = 0.0001;
idex =1;

%----------------------训练出W-------------------------%
while ( length(find(abs(e)>Bmin)) >0 ) &&(idex < Kmax) %不满足条件  
     idex = idex +1;
     e =(trainData*w')'-b;
     ep=(e+abs(e))/2;
     b =b+(4/idex)*ep;
     w =b*pinv(trainData)';

    if(idex == Kmax)
        %disp('NO SOLUTION FOUND!');
    end
end

%---------------------计算在测试集的正确率----------------------%
 errNum = 1-length(find((testData*w')<0))/50;