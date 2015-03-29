% 实验六运行文件
function Res(f)
clc;
load ORL;%加载数据，数据集叫faces10304*400
trainSet = mod(1:400,10)<=5 & mod(1:400,10)~=0;%取得每个人脸前五个的照片的下标
train = faces(:,trainSet); %训练集
test = faces(:,~trainSet); %测试集
clear faces;%释放缓存，否则很卡
%------------------当无参数或参数不等于1时，运行如下代码---------------------%
if nargin == 0 || f ~=1
    err = MDA(train,test);
    fprintf('MDA的正确率为:%f \n',err);
    err = DPDR(train,test);
    fprintf('DPDR的正确率为:%f \n',err);
    err = DPDRerr(train,test);
    fprintf('DPDR的重建误差ETE为:%f \n',err);
    err = DPDRerr(train,test,1);
    fprintf('DPDR的重建误差ETE+为:%f \n',err);
%-----------------------当参数等于1时，运行PCA的结果------------------------%
else
    res = zeros(30,1);
    ete = zeros(30,1);
    etep = zeros(30,1);
    for i=1:30
        res(i) = PCA(train,test,i+69);
        ete(i) = PCAerr(train,test,i+69);
        etep(i) = PCAerr(train,test,i+69,1);
    end
    x = 70:99;
    figure
    plot(x,res);
    xlabel('PCA降维后能量所占大小');
    ylabel('正确率');
    figure
    plot(x,ete);
    xlabel('PCA降维后能量所占大小');
    ylabel('重建误差ETE');
    figure
    plot(x,etep);
    xlabel('PCA降维后能量所占大小');
    ylabel('重建误差ETE+');
end
