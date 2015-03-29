%�㷨7��ƽ��winnow�㷨
function errNum = BalancedWinnow(trainData,testData)

trainData(find(trainData<0)) = -trainData(find(trainData<0));%����Ԥ����
testData(find(testData<0)) = -testData(find(testData<0));

wp = [1,1,1,1,1]'/2;;%����Ȩ����
wm = -wp;%����Ȩ����
alpha = 3;%���Ե�����ֵ��alpha>1

len = 1;
max = 10000;
idex = 1;

while len>0 && idex < max
    idex = idex+1;
    
    for i=1:50
        
        d = trainData(i,:)*wp - trainData(i,:)*wm;
        if (d) < 0 %��ʾ�ִ�
        
            if i<26 %class1 �ִ�
                for j=1:5
                    y = trainData(i,j);
                    wp(j) = alpha^y*wp(j);
                    wm(j) = alpha^(-y)*wm(j);
                end
            end
            
            if i>25 %class2 �ִ�
                for j=1:5
                    y = trainData(i,j);
                    wm(j) = alpha^y*wm(j);
                    wp(j) = alpha^(-y)*wp(j);
                end
            end
        end
        
    end
    
    m=find( (trainData*wp -trainData*wm) < 0 );%����ִ������
    len = length(m);
    
    if(idex == max)
        disp('�㷨7���г�������������!');
    end
end

%---------------------�����ڲ��Լ�����ȷ��----------------------%
 errNum = 1-length(find((testData*wp-testData*wm)<0))/50;
 
 