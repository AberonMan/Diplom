function [ randX, randY,randZ ] = generateUniformDistributedPoints( x,z, n)
% hold on;
% line(x,z,'marker','s','linestyle','none','markerfacecolor',[1,1,0]);
randX = zeros(1,n);
randY = zeros(1,n);

ix=convhull(x,z);
% line(x(ix),z(ix),'marker','o','markerfacecolor',[0,0,0],'color',[0,0,0]);
calcN = ceil(sqrt(n));
resultRundX = [];
resultRundZ = [];
while(length(resultRundX) < n)
    randX = min(x) + abs(min(x) - max(x))*rand(1,calcN);
    randZ = min(z) + abs(min(z)- max(z))*rand(1,calcN);
%     line(randX,randZ,'marker','.','linestyle','none');
    xP = x(ix);
    zP =z(ix);
    [xd,zd]=meshgrid(randX,randZ);
    ip=inpolygon(xd,zd,xP,zP);
    innerXPoint = xd(ip);
    innerZPoint = zd(ip);
%     line(innerXPoint,innerZPoint,'marker','.','linestyle','none');
    len = 0;
    if ( length(resultRundX) + length(innerXPoint) < n)
        len = length(innerXPoint);
    else
        len = n - length(resultRundX);
    end
    resultRundX = [resultRundX innerXPoint(1:len)'];
    resultRundZ = [resultRundZ innerZPoint(1:len)'];
end
% hold off;
randX = resultRundX;
randZ = resultRundZ;
randY = zeros(1,n);
end