%MDA函数，,train为训练集，test为测试集， err为分类正确率
function err =MDA(train,test)
%--------------------------避免维数灾难，先用PCA降维-----------------------%
tmean = mean(train,2); %训练集的均值
ts = (train - repmat(tmean,1,200))'*(train - repmat(tmean,1,200));%训练集的散布矩阵
[p,la,exp] = PCACOV(ts);
for i=1:200
    if(sum(exp(1:i,:)) > 80); %当能量占到80%时，退出
        id = i;
        break;
    end
end
w = pinv(train')*p(:, 1:id);
train = w'*train;%降维后训练集
test = w'*test;%降维后测试集
err = 0;%正确的数量

label = ones(1,5);
for i=2:40
   label =[label,ones(1,5)*i]; %每一类的标记
end

[d,n]=size(train);
Cmean=zeros(d,40);%保存40个类的均值
Smean=zeros(d,1);%总体均值

for  i=1:n %统计每类中模式之和与模式个数
    Cmean(:, label(i))= Cmean(:,label(i)) + train(:,i);
end
for i=1:40
    Smean =  Smean + Cmean(:,i);
end
Smean = Smean / n;%得到总体均值
Cmean = Cmean /5;%得到各类均值
%--------------------求出类内散布矩阵，p99 式109----------------------------%
SW=zeros(d,d); 
for i=1:n
    SW = ( train(:,i)-Cmean(:,label(i)))*( train(:,i)-Cmean(:,label(i)))' + SW ;
end
%--------------------求出类间散布矩阵，p100 式115----------------------------%
SB = zeros(d,d);

for r=1:40
    SB = SB + 5 * ( train(:,r)-Smean )*( train(:,r)- Smean )';
end
%------------------------------算出方向向量mw----------------------------------%
[mw,la,exp] = PCACOV(pinv(SW)*SB);

%----------------------------------分类------------------------------------%
pTrain = mw'*train;
pTest = mw'*test;
for i=1:200
    dis = pdist2(pTrain',pTest(:,i)');
    idex = find(dis == min(dis));
    %判断是否分对    
    if(abs(i-idex)<5) %首先要小于5
        if mod(idex,5) < 5  && mod(i,5) < 5
            err = err+1;
        elseif mod(idex,5) > 5  && mod(i,5) > 5
            err = err+1;
        end
    end
end
err = err/200.0;%正确率



