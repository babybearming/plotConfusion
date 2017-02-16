clc;clear;

% 参数初始化
filePath='./results/';
fileNameEnd='_Forecast_1-10day.csv';

startDate='01-Dec-2016'; 
endDate='15-Jan-2017';
forecastDateNums=10;
outFileData=cell(forecastDateNums,1);%十天预报结果

% 日期处理
trueStartDate=datestr(datenum(startDate)-forecastDateNums);
trueEndDate=datestr(datenum(endDate)-1);

allDates=datenum(trueStartDate):datenum(trueEndDate);
allDateStr=datestr(allDates);
datesNums=length(allDateStr(:,1));

% 提取预报数据
for i=1:datesNums
    fileName=[filePath allDateStr(i,:) fileNameEnd];
    M=importdata(fileName);
    for j=1:forecastDateNums
        outFileData{j}(i,:)=M(j+1,:);
    end
end

for i=1:forecastDateNums
    forecastData{i}(1:datesNums-forecastDateNums+1,:)=outFileData{i}(forecastDateNums-i+1:end-i+1,:); 
end

save forecastData.mat forecastData

% 提取观测数据
M=importdata('OBS-20161201-20170115.csv');
obsData=M(2:end,2:end);
save obsData.mat obsData

% c=confusionmat(obsData(:,8),forecastData{1}(:,8));
% 
% obsdata54428=obsData(:,8);
% obs=obsdata54428+1;
% forecastdata54517=forecastData{1}(:,8);
% fore=forecastdata54517+1;
% 
% figure
% subplot(2,5,1)
% plotconfusion(ind2vec(obs'),ind2vec(fore'));

