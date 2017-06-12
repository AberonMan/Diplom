function plotVerPenetrateGraph( filename, beginDepth, endDepth, step)

n = (endDepth - beginDepth)/step;
p = zeros(1, n);
depth =linspace(beginDepth,endDepth,n);
for i = 1:1:n
    p(i) = dissectDataWithBreakeage(filename,depth(i));
end
depth =linspace(beginDepth,endDepth,length(p));
[xData, yData] = prepareCurveData( depth, p );

% Set up fittype and options.
ft = fittype( 'poly7' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'LAR';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.


figure('Units', 'pixels', ...
    'Position', [100 100 500 375]);
hold on;
h = plot( xData,fitresult(xData));
set(h                          , ...
    'LineWidth'       , 2);
hTitle  = title ('Зависимость вероятности пробития от глубины пробития');
hXLabel = xlabel('Глубина пробития   (мм)'                     );
hYLabel = ylabel('Вероятность  (--/--)'                      );
 set( gca                       , ...
     'FontName'   , 'Helvetica' );
 set([hTitle, hXLabel, hYLabel], ...
     'FontName'   , 'AvantGarde');
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
     'YTick'       , 0:0.1:1, ...
     'LineWidth'   , 1         );
 axis tight;
 grid on;
end


