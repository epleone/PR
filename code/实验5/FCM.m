%FCM �㷨,������������ŷʽ����,���ؾ������;������ģ�Ĭ�Ϲ�ʽ�е�bΪ2
function [res center]= FCM(data,center,beta)
[k len] = size(center);
res = cell(k+1,1); 
for i=1:k
    res{i,1} = center(i,:);
end
theta = 0.001;%��ֵ
idex = 1;%ѭ������
b = 2;%%���Ʋ�ͬ������ɻ�ϵ����ɲ�����Ĭ��Ϊ2
maxI = 10000;%���ѭ������
PreCenter = 100*center; %ǰһ����������
jp = max(max(abs(PreCenter - center))); %�б�׼��
%------------------------������������----------------------------%
while jp> theta && idex < maxI
    idex = idex + 1;
    PreCenter = center; %ǰһ����������
    
    if nargin == 2 %������������ŷʽ����
        dis = pdist2(data,center,'Euclidean');%ŷʽ�������
    else %���ø����ľ������
        dis = BetaDistance(data,center,beta);%���ø����Ķ���������beta�Զ���
    end
    
    %����p425����ʽ33�����µ������Ⱦ���
    dis = (1 ./ dis).^ (1/(b-1));  %�Ծ�������ÿһ��Ԫ������,Ȼ�����1/(b-1)�η�
    P = (dis ./ repmat(sum(dis,2),1,k)).^b;%��ÿ�еĺ�Ϊ1,�ٳ���b�η�
    
    %����p425����ʽ32�����µľ�������
    center = (P'*data) ./ (sum(P)'*ones(1,3)); 
    
    jp = max(max(abs(PreCenter - center))); %�б�׼�򣬾�������Ԫ��
    if idex == maxI
        disp('FCM time over!');
    end
end
fprintf('��������Ϊ:%d\n',idex);

%------------------�õ�ÿһ��ķ������----------------------------%
 for i=1:20
        flag = find(P(i,:)==max(P(i,:))); %��������������±꣬��Ӧ��Ҫ�ֵ���
        if length(flag) > 1
            flag = k+1; %δ�ֿ�
        end
        res{flag,1} = [res{flag,1};data(i,:)]; %���������
 end
 
 for j=1:k
    res{j,1}(1,:)=[]; %ȥ����һ�У���Ϊ���ʼ�ľ������ģ������������������
 end
