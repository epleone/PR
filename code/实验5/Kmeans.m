%K-means �㷨,������������ŷʽ����,���ؾ������;�������
function [res center]= Kmeans(data,center,beta)
[k len] = size(center);
res = cell(k+1,1); %http://www.ilovematlab.cn/thread-64002-1-1.html 7#
for i=1:k
    res{i,1} = center(i,:);
end

if nargin == 2 %������������ŷʽ����
    
    for i=1:20
        dis = pdist2(data(i,:),center,'Euclidean');%ŷʽ�������
        flag = find(dis==min(dis)); %�����С�ľ�����±꣬��Ӧ��Ҫ�ֵ���
        if length(flag) > 1
            flag = k+1; %δ�ֿ�
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %���������
        
        for j=1:k
            center(j,:) = mean(res{j,1},1);%����ƽ��,����µľ�������
        end
    end
    
    for j=1:k
        res{j,1}(1,:)=[]; %ȥ����һ�У���Ϊ���ʼ�ľ������ģ������������������
    end
    
else %���ø����ľ������
    for i=1:20
        dis = BetaDistance(data(i,:),center,beta);%���ø����Ķ���������beta�Զ���
        flag = find(dis==min(dis)); %�����С�ľ�����±꣬��Ӧ��Ҫ�ֵ���
        if length(flag) > 1
            flag = k+1; %δ�ֿ�
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %���������
        
        for j=1:k
            center(j,:) = mean(res{j,1},1);%����ƽ��,����µľ�������
        end
    end
    
    for j=1:k
        res{j,1}(1,:)=[]; %ȥ����һ�У���Ϊ���ʼ�ľ������ģ������������������
    end
end


