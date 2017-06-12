% the data
     x=[1,2,3,4,1];
     y=[1,2 4 2 1];
     nx=200;
     ny=200;
    
% the engine
%      xp=linspace(min(x),max(x),nx);
%      yp=linspace(min(y),max(y),ny);
     xp = min(x) + abs(max(x) - min(x))*rand(1,nx);
     yp = min(y) + abs(max(y) - min(y))*rand(1,ny);
     [xd,yd]=meshgrid(xp,yp);
     ip=inpolygon(xd,yd,x,y);
% the result
     plot(x,y,'linewidth',2);
     line(xd(ip),yd(ip),'marker','.','linestyle','none');