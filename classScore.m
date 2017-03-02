% 该程序用于计算霾1-4等级下的TS评分及空、漏报率
% 变量定义
% 输入：obsData、forecastData(观测及预报值）
% 输出：
%
clear;clc;

% 预报和实测数据读取
load('forecastData.mat');
load('obsData.mat');

%% 各等级观测数据提取及相应预报数据提取（各站处理）
% tscore=cell(4,10); % 分4等级存储各站1-10天预报评分

% 等级1-4 ts评分、漏报率
for k=1:4
for i=1:13
    obs=obsData(:,i);
    r=find(obs==k);
    for j=1:10  %1-10天计算
        foredata=forecastData{1,j}(:,i);
        fore=foredata(r);
        tscore{1,k}(j,i)=mean(ts(fore,obs(r)));
        lbl{1,k}(j,i)=sum((fore-obs(r))~=0)/length(fore);
    end
end
end
% 等级1-4 空报率
for k=1:4
for i=1:13
    obs=obsData(:,i);
    for j=1:10  %1-10天计算
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
        

