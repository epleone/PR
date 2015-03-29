%获得实验数据，20个点的测试集Dtest，训练集Dtrain（90个点），验证集Dval（10个点）
function [Dtest Dtrain Dval]=getData()
Dtest = unifrnd(0, 1, 20, 2); %测试集，前十个点属于 w1 后十个点属于 w2
Dtrain = unifrnd(0, 1, 90, 2); %训练集，前45个点属于 w1 后45个点属于 w2
Dval = unifrnd(0, 1, 10, 2); %验证集，前5个点属于 w1 后5个点属于 w2