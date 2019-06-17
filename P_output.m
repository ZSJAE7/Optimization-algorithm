function P_output (Population,time,Algorithm,Problem,M,Run)
% �㷨����ĸ�ʽ�����, ������������ָ��ֵ,����ͼ��,��������
% ����: Population, �㷨�Ľ��(���߿ռ�)
%       time,       �㷨�ĺ�ʱ
%       Algorithm,  �㷨����
%       Problem,    ������������
%       M,          ��������ά��
%       Run,        ���д������

    %���㺯��ֵ
    FunctionValue = P_objective('value',Problem,M,Population);
    
    %ȥ����֧�����
    NonDominated  = P_sort(FunctionValue,'first')==1;
    Population    = Population(NonDominated,:);
    FunctionValue = FunctionValue(NonDominated,:);
    
    %������ʵ������
    TruePoint = P_objective('true',Problem,M,500);
    
    %���۽������
    IGD = P_evaluate('IGD',FunctionValue,TruePoint)
    HV  = P_evaluate('HV',FunctionValue,TruePoint)
    
    %���ƽ��
    if M < 4
        figure;
        P_draw(FunctionValue);
        title([Algorithm,' on ',Problem,' with ',num2str(M),' objectives']);
        Range(1:2:2*M) = min(TruePoint,[],1);
        Range(2:2:2*M) = max(TruePoint,[],1)*1.02;
        axis(Range);
        set(gcf,'Name',[num2str(size(FunctionValue,1)),' points  IGD=',num2str(IGD,5),'  HV=',num2str(HV,5),'  Runtime=',num2str(time,5),'s']);
        pause(0.1);
    end
    
    %������
%     eval(['save Data/',Algorithm,'/',Algorithm,'_',Problem,'_',num2str(M),'_',num2str(Run),' Population FunctionValue time'])
end

