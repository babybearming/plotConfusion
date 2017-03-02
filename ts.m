function tscore=ts(forecastdata,obsdata)
% 输入列向量（可以为一个数字），输出TS评分
obs=obsdata;
fore=forecastdata;
hs=length(obs);
for i=1:hs
    if obs(i)==0&fore(i)~=0
        tscore(i)=0;
        continue
    end
    if fore(i)==0&obs(i)~=0
        tscore(i)=0;
        continue
    end
    switch abs(obs(i)-fore(i))
        case 0
            tscore(i)=100;
        case 1
            tscore(i)=80;
        case 2
            tscore(i)=60;
        case 3
            tscore(i)=40;
        otherwise
            disp('erro');
    end
end
tscore=tscore';
% confusiondata=confusionmat(o,f);
% tscore=confusiondata;
end