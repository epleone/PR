%�㷨9��������ԣ���ɳ��㷨;ѧϰ��ȡ1/k;
function errNum = SinSamRelaxationWithMargin(trainData,testData)

w = [0.1,0,0,0,0]';%w������Ȩ������Ϊn+1ά
b = 0.01;%ԣ�����˴�ȡ0.01
m=find( (trainData*w) < -b );%����ִ������
err = trainData(m,:);%�ִ������
[jp temp]= size(err);%�ִ������
max = 10000;%����������
idex =1;
%----------------------ѵ����W-------------------------%
while (jp > 0) && (idex < max) %����������
    idex = idex +1;
    
    for i=1:jp
        y = err(i,:);
        w = w + (1/idex)*(b-y*w)*y'/dot(y,y);
    end
    
    m=find( (trainData*w) < -b );%����ִ������
    err = trainData(m,:);%�ִ������
    [jp temp] = size(err);%�ִ������
    
    if(idex == max)
        disp('�㷨9���г�������������!!');
    end
    
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*w)<0))/50;