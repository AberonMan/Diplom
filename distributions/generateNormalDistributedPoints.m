function [ randX, randY,randZ ] = generateNormalDistributedPoints(x,z, n,s)
% line(x,z,'marker','s','linestyle','none','markerfacecolor',[1,1,0]);
ix=convhull(x,z);
% line(x(ix),z(ix),'marker','o','markerfacecolor',[0,0,0],'color',[0,0,0]);
xP = x(ix);
zP =z(ix);
[geom] = polygeom( xP, zP );
center =[geom(2),0,geom(3)];
A=randn(n,2);
normX=A(:,1)';
normZ=A(:,2)';
randX = center(1) + s*normX;
randZ = center(3) + s*normZ;
%  line(randX,randZ,'marker','.','linestyle','none');
ip=inpolygon(randX,randZ,xP,zP);
innerXPoint = randX(ip);
innerZPoint = randZ(ip);
% line(innerXPoint,innerZPoint,'marker','.','linestyle','none');
randX = innerXPoint';
randZ = innerZPoint';
randY = zeros(1,n);
end

