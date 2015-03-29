%DPDR������,trainΪѵ������testΪ���Լ��� errΪ������ȷ��,ʹ��QR�ֽ�
function err =DPDR(train,test)
%--------------------------����ά�����ѣ�����PCA��ά-----------------------%
tmean = mean(train,2); %ѵ�����ľ�ֵ
ts = (train - repmat(tmean,1,200))'*(train - repmat(tmean,1,200));%ѵ������ɢ������
[p,la,exp] = PCACOV(ts);
for i=1:200
    if(sum(exp(1:i,:)) > 85); %������ռ��85%ʱ���˳�
        id = i;
        break;
    end
end
w = pinv(train')*p(:, 1:id);
train = w'*train;%��ά��ѵ����
test = w'*test;%��ά����Լ�
err = 0;%��ȷ������

%-------------------------------QR�ֽ�---------------------------------%
[Q R] = qr(train); %������PCA��ά�����ڴ��������

%----------------------------------����------------------------------------%
pTrain = Q'*train;
pTest = Q'*test;

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
