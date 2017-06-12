function [ area ] = caclArea( x,y,z )
%Апроксимируем данные треугольниками;
% figure
% plotCaclulatedArmored(x,y,z,[],[],[]);
tri = delaunay(z,x);
area = 0;
for i =1:1:length(tri)
    v1 = [x(tri(i,1)) y(tri(i,1)) z(tri(i,1))];
    v2 = [x(tri(i,2)) y(tri(i,2)) z(tri(i,2))];
    v3 = [x(tri(i,3)) y(tri(i,3)) z(tri(i,3))];
    P = [v1;v2;v3];
    L=[sqrt(sum((P(1,:)-P(2,:)).^2)) sqrt(sum((P(2,:)-P(3,:)).^2)) sqrt(sum((P(3,:)-P(1,:)).^2))];
    s = ((L(1)+L(2)+L(3))/2);
    A = sqrt(s*(s-L(1))*(s-L(2))*(s-L(3)));
    area = area + A;
end

end

