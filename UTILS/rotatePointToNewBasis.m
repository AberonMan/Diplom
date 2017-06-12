function [ point ] =  rotatePointToNewBasis( point,planeNorm,planePoint )
[ v,u,w ] = generateNewBasis( planeNorm );
point = [dot(point - planePoint,v)  dot(point - planePoint,u)  dot(point -planePoint,w)];
end

