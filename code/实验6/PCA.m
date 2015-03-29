%PCA����,trainΪѵ������testΪ���Լ���powerΪPCA��ά�������ȣ�errΪ������ȷ��
function err=PCA(train,test,power)
%-------------------------�õ�ɢ������p95 ʽ84----------------------------%
tmean = mean(train,2); %���Լ��ľ�ֵ,�������ֵ�ķ����ǲ��õģ����ǰ����㣬���ڴ����
ts = (train - repmat(tmean,1,200))'*(train - repmat(tmean,1,200));%���Լ���ɢ������


%------------------------------�����������w-------------------------------%
%��matlab�Դ���PCACOV������ɢ������������ֽ�
[p,la,exp] = PCACOV(ts);

for i=1:200
    if(sum(exp(1:i,:)) > power); %������ռ��power%ʱ���˳�
        id = i;
        break;
    end
end
w = pinv(train')*p(:, 1:id);

%---------------------------------��ά-------------------------------------%
pTrain = w'*train;%ѵ����
pTest = w'*test;%���Լ�
err = 0;%��ȷ������

%----------------------------------����------------------------------------%
for i=1:200
    dis = pdist2(pTrain',pTest(:,i)');
    idex = find(dis == min(dis));
%�ж��Ƿ�ֶ�    
    if(abs(i-idex)<5) %����ҪС��5
        if mod(idex,5) < 5  && mod(i,5) < 5
            err = err+1;
        elseif mod(idex,5) > 5  && mod(i,5) > 5
            err = err+1;
        end
    end
end
err = err/200.0;%��ȷ��

