clear;clc;

% 预报和实测数据读取
load('forecastData.mat');
load('obsData.mat');

numsofdata=length(obsData(:,1));
tscore=cell(1,10); % 存取各站1-10天的预报评分
tscoremean=zeros(10,13); % 存取各占1-10天的预报评分平均值
tszql=zeros(10,13); % 存取各站1-10天预报有无准确率
% 24小时预报评分
for i=1:10
    foredata=forecastData{1,i};
    for j=1:13 % 十三个站计算
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


