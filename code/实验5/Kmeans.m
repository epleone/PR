%K-means 算法,两个参数采用欧式度量,返回聚类结果和聚类中心
function [res center]= Kmeans(data,center,beta)
[k len] = size(center);
res = cell(k+1,1); %http://www.ilovematlab.cn/thread-64002-1-1.html 7#
for i=1:k
    res{i,1} = center(i,:);
end

if nargin == 2 %两个参数采用欧式度量
    
    for i=1:20
        dis = pdist2(data(i,:),center,'Euclidean');%欧式距离度量
        flag = find(dis==min(dis)); %求出最小的距离的下标，即应该要分的类
        if length(flag) > 1
            flag = k+1; %未分开
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %加入分类结果
        
        for j=1:k
            center(j,:) = mean(res{j,1},1);%按列平均,求出新的聚类中心
        end
    end
    
    for j=1:k
        res{j,1}(1,:)=[]; %去掉第一行，它为最初始的聚类中心，不是所在数据里面的
    end
    
else %采用给定的距离度量
    for i=1:20
        dis = BetaDistance(data(i,:),center,beta);%采用给定的度量函数，beta自定义
        flag = find(dis==min(dis)); %求出最小的距离的下标，即应该要分的类
        if length(flag) > 1
            flag = k+1; %未分开
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %加入分类结果
        
        for j=1:k
            center(j,:) = mean(res{j,1},1);%按列平均,求出新的聚类中心
        end
    end
    
    for j=1:k
        res{j,1}(1,:)=[]; %去掉第一行，它为最初始的聚类中心，不是所在数据里面的
    end
end


