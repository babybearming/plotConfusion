clear;clc;

% Ԥ����ʵ�����ݶ�ȡ
load('forecastData.mat');
load('obsData.mat');

numsofdata=length(obsData(:,1));
tscore=cell(1,10); % ��ȡ��վ1-10���Ԥ������
tscoremean=zeros(10,13); % ��ȡ��ռ1-10���Ԥ������ƽ��ֵ
tszql=zeros(10,13); % ��ȡ��վ1-10��Ԥ������׼ȷ��
% 24СʱԤ������
for i=1:10
    foredata=forecastData{1,i};
    for j=1:13 % ʮ����վ����
    tt=ts(foredata(:,j),obsData(:,j));
    tscore{1,i}(:,j)=tt;
    end
end

for i=1:10
    for j=1:13
    temp=tscore{1,i}(:,j);
    tszql(i,j)=length(temp(temp>0,:))/numsofdata;
    tscoremean(i,j)=mean(temp);
    end
end


