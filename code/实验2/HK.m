%�㷨11 Ho-Kashyap�㷨��ѧϰ��ȡ1/k
function errNum = HK(trainData,testData)

w = [0.1,0,0,0,0];%w������Ȩ������Ϊn+1ά
b = ones(1,50);%ԣ��
e = b;
Kmax = 10000;%����������
Bmin = 0.001;
idex =1;

%----------------------ѵ����W-------------------------%
while ( length(find(abs(e)>Bmin)) >0 ) &&(idex < Kmax) %����������  
     idex = idex +1;
     e =(trainData*w')'-b;
     ep=(e+abs(e))/2;
     b =b+(2/idex)*ep;%�α�P205ҳ���˴�Ϊb = a + 2*ѧϰ��*e+,����a��b��ά����һ�����޷���ӣ��ʸ�Ϊb
     w =b*pinv(trainData)';

    if(idex == Kmax)
        %disp('NO SOLUTION FOUND!');
    end
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*w')<0))/50;