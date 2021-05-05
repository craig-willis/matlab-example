load Data_Airline

y = log(Data);
T = length(y);

Mdl = arima('Constant',0,'D',1,'Seasonality',12,...
    'MALags',1,'SMALags',12);

y0 = y(1:13);
[EstMdl,EstParamCov] = estimate(Mdl,y(14:end),'Y0',y0)


res = infer(EstMdl,y(14:end),'Y0',y0);

figure
plot(14:T,res)
xlim([0,T])
title('Residuals')
axis tight


