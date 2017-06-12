function [ v,u,w ] = generateNewBasis( planeNorm )
u = planeNorm;
v = [-planeNorm(1),0,planeNorm(3)];
w = cross(u,v);
end

