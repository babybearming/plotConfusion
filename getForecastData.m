clc;clear;

% forecastData
filePath='./results/';
fileNameEnd='_Forecast_1-10day.csv';

startDate='01-Dec-2016'; 
endDate='15-Jan-2017';
forecastDateNums=10;
outFileData=cell(forecastDateNums,1);%十天预报结果

trueStartDate=datestr(datenum(startDate)-forecastDateNums);
trueEndDate=datestr(datenum(endDate)-1);

allDates=datenum(trueStartDate):datenum(trueEndDate);
allDateStr=datestr(allDates);
datesNums=length(allDateStr(:,1));

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

% obsData
M=importdata('OBS-20161201-20170115.csv');
obsData=M(2:end,2:end);

c=confusionmat(obsData(:,8),forecastData{1}(:,8));

%plotconfusion(num2str(obsData(:,1)),num2str(forecastData{1}(:,1)));

