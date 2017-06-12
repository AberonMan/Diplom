function projectedPoint = projectPoint(point,planeNorm , planePoint )
%   projectedPoint = point - dot(point - planePoint, planeNorm) * planeNorm;
d = - planeNorm(1)*planePoint(1) - planeNorm(2)*planePoint(2) - planeNorm(3)*planePoint(3);
destination  = dot(point,planeNorm) + d;
if (destination == 0)
    projectedPoint = point;
else
    projectedPoint = point -  destination * planeNorm;
end    
end
