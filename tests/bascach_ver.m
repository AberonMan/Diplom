
coffe = 0.065/0.046;
F = [1.109
    1.663
    2.217
    2.772
    3.326
    3.880
    4.435
    4.989
    5.543
    6.097
    6.652
    
    ] *65;
L =[0.230
    0.253
    0.269
    0.273
    0.283
    0.279
    0.261
    0.247
    0.219
    0.196
    0.196
    ] * coffe * 1000;

L_Max = [0.243
    0.267
    0.281
    0.298
    0.308
    0.311
    0.310
    0.302
    0.296
    0.284
    0.280
    ] * coffe * 1000;

L_scololo = [5.7609
6.6739
7.4348
8.0652
8.587
9.0217
9.3478
9.5435
9.6304
9.6957
9.7174
] * 65;

L_soso = [4.739
    5.239
    5.5
    5.63
    5.478
    5.174
    4.391
    3.848
    3.457
    3.196
    2.913
    ] *  65;

P = arrayfun(@(depth) dissectDataWithBreakeage('C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\calculation_norm.txt',depth),L);
P_max = arrayfun(@(depth) dissectDataWithBreakeage('C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\calculation_norm.txt',depth),L_Max);
P_scololo = arrayfun(@(depth) dissectDataWithBreakeage('C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\calculation_norm.txt',depth),L_scololo);
P_soso =  arrayfun(@(depth) dissectDataWithBreakeage('C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\calculation_norm.txt',depth),L_soso);


figure('Units', 'pixels', ...
    'Position', [100 100 500 375]);
hold on;

hFit =line(F,P*100);
hFitMax =line(F,P_max*100);
hFitScololo = line(F,P_scololo*100);
hFitSoso = line(F,P_soso*100);
ylim = [0,1];
grid on
grid minor




set(hFitMax,'color',[.3 .3 .3]);
set(hFitScololo,'color',[0.8 0.9 0.2]);
set(hFitSoso,'color','r');

set(hFit                          , ...
    'LineWidth'       , 1.5          , ...
    'Marker'          , 'o'         , ...
    'MarkerSize'      , 6           , ...
    'MarkerEdgeColor' , [.2 .2 .2]  , ...
    'MarkerFaceColor' , [.7 .7 .7]  );
set(hFitMax                          , ...
    'LineWidth'       , 1.5          , ...
    'Marker'          , 'o'         , ...
    'MarkerSize'      , 6           , ...
    'MarkerEdgeColor' , [.2 .2 .2]  , ...
    'MarkerFaceColor' , [.7 .7 .7]  );

set(hFitScololo                          , ...
    'LineWidth'       , 1.5          , ...
    'Marker'          , 'o'         , ...
    'MarkerSize'      , 6           , ...
    'MarkerEdgeColor' , [.2 .2 .2]  , ...
    'MarkerFaceColor' , [.7 .7 .7]  );

set(hFitSoso                          , ...
    'LineWidth'       , 1.5          , ...
    'Marker'          , 'o'         , ...
    'MarkerSize'      , 6           , ...
    'MarkerEdgeColor' , [.2 .2 .2]  , ...
    'MarkerFaceColor' , [.7 .7 .7]  );


hTitle  = title ('Зависимост вероятности бронепробития от фокусного расстояния');
hXLabel = xlabel('Фокусное расстояние  (мм)'                     );
hYLabel = ylabel('Вероятность  (%)'                      );

hLegend = legend( ...
    [hFitMax, hFit,hFitScololo,hFitSoso], ...
    'В 2 раза точнее' , ...
    'В 1.5 раза точнее', ...
    'Идеальный заряд',...
    'Штатный  заряд',...
    'location','NorthWest');



set( gca                       , ...
    'FontName'   , 'Helvetica' );
set([hTitle, hXLabel, hYLabel], ...
    'FontName'   , 'AvantGarde');
set([hLegend, gca]             , ...
    'FontSize'   , 8           );
set([hXLabel, hYLabel]  , ...
    'FontSize'   , 10          );
set( hTitle                    , ...
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );

set(gca, ...
    'Box'         , 'on'     , ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.02 .02] , ...
    'XMinorTick'  , 'on'      , ...
    'YMinorTick'  , 'on'      , ...
    'YGrid'       , 'on'      , ...
    'XColor'      , [.3 .3 .3], ...
    'YColor'      , [.3 .3 .3], ...
    'LineWidth'   , 1         );








