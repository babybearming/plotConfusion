clc;clear;
% Ԥ����ʵ�����ݶ�ȡ
load('forecastData.mat');
load('obsData.mat');

% ������ʼ��
pngfilepath='.\pngconfusion\';
stationname={'����' '����' '����'	'����' '����' '����' '����' ...
    '����' '����' '����' '���'	'����' '����'};
% ��ȡ���ݣ����ƻ�������ͼ

for i=1:10  %1-10��
    foredata=forecastData{1,i};
    for j=1:13 % 13��վ
        fore=foredata(:,j);
        obs=obsData(:,j);
        %forestr=num2str(fore);
        %obsstr=num2str(obs);
        obsstr=obs+1;
        forestr=fore+1;
        plotconfusion(ind2vec(obsstr'),ind2vec(forestr'));
        saveas(gcf,[pngfilepath stationname{j} 'Ԥ��ʱЧΪ' num2str(i) '��Ļ�������ͼ.png'])
    end
end