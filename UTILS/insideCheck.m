function [ v ] = insideCheck(depth,v1)
vecLength = norm(v1);
if  (vecLength <= depth)
    tetta = acos(v1(2)/vecLength);
    phi = acos(v1(1)/(vecLength/sin(tetta)));
    v1 = [depth*cos(phi).*sin(tetta),depth*cos(tetta),depth*sin(phi).*sin(tetta)];
end
 v = v1;
end

