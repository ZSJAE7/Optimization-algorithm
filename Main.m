%������
function Main()
clc;format short;addpath public;
    
    %�㷨����
    Algorithm = {'NSGA-II'};
    %��������
    Problem = {'ZDT1'};
    %����ά��
    Objectives =2;

    %��������

    Start(Algorithm,Problem,Objectives,1);

end