%�㷨10 ��Сƽ������㷨��ѧϰ��ȡ1/k
function errNum = LMS(trainData,testData)

w = [0.1,0,0,0,0];%w������Ȩ������Ϊn+1ά
b = ones(1,50);%ԣ��
k=0;
jp = [1,1,1,1,1];
max = 10000;%����������
idex =1;
%----------------------ѵ����W-------------------------%
while (norm(jp) > 0.00001) && (idex < max) %����������
     idex = idex +1;
     k=mod(k+1,50);
     
     if k==0;
          k=50;
     end;
     
     jp=(1/idex)*(b(k)-w*trainData(k,:)')*trainData(k,:);%����
     w=w+jp;
     w=w/norm(w);%��һ��
 
    if(idex == max)
        disp('�㷨10���г�������������!!');
    end
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*w')<0))/50;