%�㷨4���̶�������������֪���㷨;
function  errNum = FixISSPerceptron(trainData,testData)
%����ѵ����ѵ������w
w = [0.1,0,0,0,0]';%w������Ȩ������Ϊn+1ά

m=find( (trainData*w) < 0 );%����ִ������
err = trainData(m,:);%�ִ������
[jp temp] = size(err);%�ִ������
max = 10000;%����������
idex =1;
%----------------------ѵ����W-------------------------%
while (jp > 0) && (idex < max) %����������
    idex = idex +1;
    
    for i=1:jp
        w = w + err(i,:)';
    end
    
    m=find( (trainData*w) < 0 );%����ִ������
    err = trainData(m,:);%�ִ������
    [jp temp] = size(err);%�ִ������
    
    if(idex == max)
        disp('�㷨4���г�������������!');
    end
    
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*w)<0))/50;