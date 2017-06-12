    x=[1,2,3,4,1,2,3,4,1,2,3,4]; % <- note: 34 ==> 3,4
     y= [100,100,100,100,200,200,200,200,300,300,400,400];
     xa=[1,2,3,4,4,3,2,1];
     ya=[100,100,100,100,400,400,300,300];
% now, when looking at the data
     line(x,y,'marker','s','linestyle','none','markerfacecolor',[1,1,0]);
% -and-
     ix=convhull(x,y);
     line(x(ix),y(ix),'marker','o','markerfacecolor',[0,0,0],'color',[0,0,0]);
% -and- comparing with what he/she wants
     line(xa,ya,'marker','+','linewidth',2,'color',[1,0,0]);
     set(gca,'xlim',[0,5],'ylim',[0,500]);
% he/she probably needs an alpha shaper...
% eg,
