% �ó������ڼ�����1-4�ȼ��µ�TS���ּ��ա�©����
% ��������
% ���룺obsData��forecastData(�۲⼰Ԥ��ֵ��
% �����
%
clear;clc;

% Ԥ����ʵ�����ݶ�ȡ
load('forecastData.mat');
load('obsData.mat');

%% ���ȼ��۲�������ȡ����ӦԤ��������ȡ����վ����
% tscore=cell(4,10); % ��4�ȼ��洢��վ1-10��Ԥ������

% �ȼ�1-4 ts���֡�©����
for k=1:4
for i=1:13
    obs=obsData(:,i);
    r=find(obs==k);
    for j=1:10  %1-10�����
        foredata=forecastData{1,j}(:,i);
        fore=foredata(r);
        tscore{1,k}(j,i)=mean(ts(fore,obs(r)));
        lbl{1,k}(j,i)=sum((fore-obs(r))~=0)/length(fore);
    end
end
end
% �ȼ�1-4 �ձ���
for k=1:4
for i=1:13
    obs=obsData(:,i);
    for j=1:10  %1-10�����
        foredata=forecastData{1,j}(:,i);
        r=find(foredata==k);
        fore=foredata(r);
        if r~=0
        obs1=obs(r);
        kbl{1,k}(j,i)=sum((fore-obs1)~=0)/length(obs1);
        else
        kbl{1,k}(j,i)=NaN;
        end
    end
end
end
        

