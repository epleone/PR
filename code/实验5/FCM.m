%FCM 算法,两个参数采用欧式度量,返回聚类结果和聚类中心，默认公式中的b为2
function [res center]= FCM(data,center,beta)
[k len] = size(center);
res = cell(k+1,1); 
for i=1:k
    res{i,1} = center(i,:);
end
theta = 0.001;%阈值
idex = 1;%循环次数
b = 2;%%控制不同类别自由混合的自由参数，默认为2
maxI = 10000;%最大循环次数
PreCenter = 100*center; %前一个聚类中心
jp = max(max(abs(PreCenter - center))); %判别准则
%------------------------计算隶属矩阵----------------------------%
while jp> theta && idex < maxI
    idex = idex + 1;
    PreCenter = center; %前一个聚类中心
    
    if nargin == 2 %两个参数采用欧式度量
        dis = pdist2(data,center,'Euclidean');%欧式距离度量
    else %采用给定的距离度量
        dis = BetaDistance(data,center,beta);%采用给定的度量函数，beta自定义
    end
    
    %按照p425，公式33计算新的隶属度矩阵
    dis = (1 ./ dis).^ (1/(b-1));  %对距离矩阵的每一个元素求倒数,然后乘以1/(b-1)次方
    P = (dis ./ repmat(sum(dis,2),1,k)).^b;%令每行的和为1,再乘以b次方
    
    %按照p425，公式32计算新的聚类中心
    center = (P'*data) ./ (sum(P)'*ones(1,3)); 
    
    jp = max(max(abs(PreCenter - center))); %判别准则，矩阵的最大元素
    if idex == maxI
        disp('FCM time over!');
    end
end
fprintf('迭代次数为:%d\n',idex);

%------------------得到每一类的分类情况----------------------------%
 for i=1:20
        flag = find(P(i,:)==max(P(i,:))); %求出隶属度最大的下标，即应该要分的类
        if length(flag) > 1
            flag = k+1; %未分开
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %加入分类结果
 end
 
 for j=1:k
    res{j,1}(1,:)=[]; %去掉第一行，它为最初始的聚类中心，不是所在数据里面的
 end
