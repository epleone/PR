%实验二运行结果
function Res()
clc;clear;
%加载数据
data = load ('iris.txt');
d1 = data(1:50,1:4); %class1 的数据
d2 = data(50:100,1:4);
d3 = data(100:150,1:4);

Res = ones(9,100);%用于保存100次的计算结果

%循环一百次
for i=1:100
    ran=randperm(50);%产生随机序列
    vector=ones(25,1);

    trainData13 = vertcat( horzcat(vector,d1(ran(1:25),:)),-horzcat(vector,d3(ran(1:25),:)));%测试集1 3 训练数据
    testData13 = vertcat( horzcat(vector,d1(ran(26:50),:)),-horzcat(vector,d3(ran(26:50),:)));%测试集1 3 测试数据

    Res(1,i) = BatchPerceptron(trainData13,testData13);%算法3，批处理感知器算法 在测试1 3 类错分率
    %fprintf('批处理感知器算法的正确率为：%f\n', errnum3);
    Res(2,i) = FixISSPerceptron(trainData13,testData13);%算法4，固定增量单样本感知器算法 在测试1 3 类错分率
    %fprintf('固定增量单样本感知器算法的正确率为：%f\n', errnum4);
    Res(3,i) = VarinPerceptronWithmargin(trainData13,testData13);%算法5，带裕量的变增量感知器算法 在测试1 3 类错分率
    %fprintf('带裕量的变增量感知器算法的正确率为：%f\n', errnum5);
    Res(4,i) = BatVarIncPerceptron(trainData13,testData13);%算法6，批处理变增量感知器算法 在测试1 3 类错分率
    %fprintf('批处理变增量感知器算法的正确率为：%f\n', errnum6);
    Res(5,i) = BalancedWinnow(trainData13,testData13);%算法7，平衡winnow算法 在测试1 3 类错分率
    %fprintf('平衡winnow算法的正确率为：%f\n', errnum7);
    Res(6,i) = SinSamRelaxationWithMargin(trainData13,testData13);%算法9，单样本裕量松弛算法 在测试1 3 类错分率
    %fprintf('单样本裕量松弛算法的正确率为：%f\n', errnum9);
    Res(7,i) = LMS(trainData13,testData13);%算法10，LMS算法 在测试1 3 类错分率
    %fprintf('LMS算法的正确率为：%f\n', errnum10);
    Res(8,i) = HK(trainData13,testData13);%算法11，HK算法 在测试1 3 类错分率
    %fprintf('HK算法的正确率为：%f\n', errnum11);
    Res(9,i) = MHK(trainData13,testData13);%算法12，MHK算法 在测试1 3 类错分率
    %fprintf('MHK算法的正确率为：%f\n', errnum12);
end
disp('对class1与class3采用算法3～12的运行结果!');
fprintf('批处理感知器算法的均值为：%f\t方差为%f\n', mean(Res(1,:)),var(Res(1,:)));
fprintf('固定增量单样本感知器算法的均值为：%f\t方差为%f\n', mean(Res(2,:)),var(Res(2,:)));
fprintf('带裕量的变增量感知器算法的均值为：%f\t方差为%f\n', mean(Res(3,:)),var(Res(3,:)));
fprintf('批处理变增量感知器算法的均值为：%f\t方差为%f\n', mean(Res(4,:)),var(Res(4,:)));
fprintf('平衡winnow算法的均值为：%f\t方差为%f\n', mean(Res(5,:)),var(Res(5,:)));
fprintf('单样本裕量松弛算法的均值为：%f\t方差为%f\n', mean(Res(6,:)),var(Res(6,:)));
fprintf('LMS算法的均值为：%f\t方差为%f\n', mean(Res(7,:)),var(Res(7,:)));
fprintf('HK算法的均值为：%f\t方差为%f\n', mean(Res(8,:)),var(Res(8,:)));
fprintf('MHK算法的均值为：%f\t方差为%f\n', mean(Res(9,:)),var(Res(9,:)));

%循环一百次
for i=1:100
    ran=randperm(50);%产生随机序列
    vector=ones(25,1);

    trainData23 = vertcat( horzcat(vector,d2(ran(1:25),:)),-horzcat(vector,d3(ran(1:25),:)));%测试集2 3 训练数据
    testData23 = vertcat( horzcat(vector,d2(ran(26:50),:)),-horzcat(vector,d3(ran(26:50),:)));%测试集2 3 测试数据

    Res(1,i) = BatchPerceptron(trainData23,testData23);%算法3，批处理感知器算法 在测试1 3 类错分率
    %fprintf('批处理感知器算法的正确率为：%f\n', errnum3);
    Res(2,i) = FixISSPerceptron(trainData23,testData23);%算法4，固定增量单样本感知器算法 在测试1 3 类错分率
    %fprintf('固定增量单样本感知器算法的正确率为：%f\n', errnum4);
    Res(3,i) = VarinPerceptronWithmargin(trainData23,testData23);%算法5，带裕量的变增量感知器算法 在测试1 3 类错分率
    %fprintf('带裕量的变增量感知器算法的正确率为：%f\n', errnum5);
    Res(4,i) = BatVarIncPerceptron(trainData23,testData23);%算法6，批处理变增量感知器算法 在测试1 3 类错分率
    %fprintf('批处理变增量感知器算法的正确率为：%f\n', errnum6);
    Res(5,i) = BalancedWinnow(trainData23,testData23);%算法7，平衡winnow算法 在测试1 3 类错分率
    %fprintf('平衡winnow算法的正确率为：%f\n', errnum7);
    Res(6,i) = SinSamRelaxationWithMargin(trainData23,testData23);%算法9，单样本裕量松弛算法 在测试1 3 类错分率
    %fprintf('单样本裕量松弛算法的正确率为：%f\n', errnum9);
    Res(7,i) = LMS(trainData23,testData23);%算法10，LMS算法 在测试1 3 类错分率
    %fprintf('LMS算法的正确率为：%f\n', errnum10);
    Res(8,i) = HK(trainData23,testData23);%算法11，HK算法 在测试1 3 类错分率
    %fprintf('HK算法的正确率为：%f\n', errnum11);
    Res(9,i) = MHK(trainData23,testData23);%算法12，MHK算法 在测试1 3 类错分率
    %fprintf('MHK算法的正确率为：%f\n', errnum12);
end
disp('对class2与class3采用算法3～12的运行结果!');
fprintf('批处理感知器算法的均值为：%f\t方差为%f\n', mean(Res(1,:)),var(Res(1,:)));
fprintf('固定增量单样本感知器算法的均值为：%f\t方差为%f\n', mean(Res(2,:)),var(Res(2,:)));
fprintf('带裕量的变增量感知器算法的均值为：%f\t方差为%f\n', mean(Res(3,:)),var(Res(3,:)));
fprintf('批处理变增量感知器算法的均值为：%f\t方差为%f\n', mean(Res(4,:)),var(Res(4,:)));
fprintf('平衡winnow算法的均值为：%f\t方差为%f\n', mean(Res(5,:)),var(Res(5,:)));
fprintf('单样本裕量松弛算法的均值为：%f\t方差为%f\n', mean(Res(6,:)),var(Res(6,:)));
fprintf('LMS算法的均值为：%f\t方差为%f\n', mean(Res(7,:)),var(Res(7,:)));
fprintf('HK算法的均值为：%f\t方差为%f\n', mean(Res(8,:)),var(Res(8,:)));
fprintf('MHK算法的均值为：%f\t方差为%f\n', mean(Res(9,:)),var(Res(9,:)));






