%ʵ��4�����н��
function Res()
clc;clear;
k=1;
err =linspace(0,0,10) ;%������

for i=1:5%
    [Dtest Dtrain Dval]=getData();
    %--------------------------��ѵ������-------------------------%
    %����k�Ľ��
    while k<20
        err((k+1)/2) = Train(Dtest,Dtrain,k);
        k = k+2;
    end
    %kmax=find(err==max(err))*2-1;%ȫ������
    %kmin=find(err==min(err))*2-1;%ȫ������
    kmax=find(err>err(1))*2-1;%�ֲ�����
    kmin=find(err<err(1))*2-1;%�ֲ�����
    if length(kmax)==0
        kmax =1;
    else
        kmax = kmax(1);%��ֻ֤ȡ��һ��ֵ
    end
    if length(kmin)==0
        kmin =1;
    else
        kmin = kmin(1);%��ֻ֤ȡ��һ��ֵ
    end

    %--------------------------�ڲ��Լ���-------------------------%
    maxErr = Train(Dtest,Dval,kmax);%����k�ڲ��Լ��ϵĴ�����
    minErr = Train(Dtest,Dval,kmin);%��õ�k�ڲ��Լ��ϵĴ�����
    fprintf('��%d�ε�����k=%d   ������Ϊ%f   ��õ�k=%d   ������Ϊ%f\n',i,kmax,maxErr,kmin,minErr);
    k=1;
    %pause(1);%��ʱ1��
end

%-----------------------������ͬ��k�ڲ��Լ���ѵ�����ϵ����---------------------------%
errT =linspace(0,0,10) ;%ѵ����������
errV =linspace(0,0,10) ;%���Լ�������
for k=1:2:20
    errT((k+1)/2) = Train(Dtest,Dtrain,k);
    errV((k+1)/2) = Train(Dtest,Dval,k);
end
x=1:2:20;
plot(x,errT,'r+ -',x,errV,'k* :');
xlabel('Kֵ');
ylabel('������');
legend('ѵ����������','���Լ�������',1); 


