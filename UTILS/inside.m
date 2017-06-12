function [ isInside ] = inside(quadr,randX,randY,randZ,norm,planePoint )
% приводим точки грани к новому базису
points = quadr.getPoints();
points = projectAreaOnPlane(points,norm,planePoint);
points = changePointsBasis(points,norm,planePoint);
xP = cell2mat(cellfun(@(point) point(1),points,'UniformOutput',false));
zP = cell2mat(cellfun(@(point) point(3),points,'UniformOutput',false));

% line(xP,zP,'marker','o','markerfacecolor',[0,0,0],'color',[0,0,0]);
isInside=inpolygon(randX,randZ,xP,zP);
end

