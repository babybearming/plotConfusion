clc;clear;
% 预报和实测数据读取
load('forecastData.mat');
load('obsData.mat');

% 参数初始化
pngfilepath='.\pngconfusion\';
stationname={'蓟县' '宝坻' '武清'	'宁河' '静海' '西青' '北辰' ...
    '市区' '东丽' '津南' '大港'	'汉沽' '塘沽'};
% 提取数据，绘制混淆矩阵图

for i=1:10  %1-10天
    foredata=forecastData{1,i};
    for j=1:13 % 13个站
        fore=foredata(:,j);
        obs=obsData(:,j);
        %forestr=num2str(fore);
        %obsstr=num2str(obs);
        obsstr=obs+1;
        forestr=fore+1;
        plotconfusion(ind2vec(obsstr'),ind2vec(forestr'));
        saveas(gcf,[pngfilepath stationname{j} '预报时效为' num2str(i) '天的混淆矩阵图.png'])
    end
end