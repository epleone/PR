%�㷨3���������֪���㷨;ѧϰ��ȡ1/k;
function errNum = BatchPerceptron(trainData,testData)
%����ѵ����ѵ������w

w = [0.1,0,0,0,0]';%w������Ȩ������Ϊn+1ά

m=find( (trainData*w) < 0 );%����ִ������
err = trainData(m,:);%�ִ������
err = sum(err,1);
jp = dot(err,err);%���ۺ���
max = 10000;%����������
idex =1;
%----------------------ѵ����W-------------------------%
while (jp>0.0001) && (idex < max) %����������
    idex = idex +1;
    deta = (1/idex)*err;
    w = w + deta';
    m=find( (trainData*w) < 0 );%����ִ������
    err = trainData(m,:);%�ִ������
    err = sum(err,1);
    jp = sqrt(dot(deta,deta));%���ۺ���
    
    if(idex == max)
        disp('�㷨3���г�������������!');
    end
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*w)<0))/50;

