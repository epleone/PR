%���ʵ�����ݣ�20����Ĳ��Լ�Dtest��ѵ����Dtrain��90���㣩����֤��Dval��10���㣩
function [Dtest Dtrain Dval]=getData()
Dtest = unifrnd(0, 1, 20, 2); %���Լ���ǰʮ�������� w1 ��ʮ�������� w2
Dtrain = unifrnd(0, 1, 90, 2); %ѵ������ǰ45�������� w1 ��45�������� w2
Dval = unifrnd(0, 1, 10, 2); %��֤����ǰ5�������� w1 ��5�������� w2