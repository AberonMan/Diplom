function [x,y, z ] = reverseData( filename )
[x,y,z] = loadResultFromFile(filename);
h = zeros(1, length(x)/2);
size = length(x)/2;
for i = 1:1:size
    h(i) = sqrt(x(i)^2 + y(i)^2 + z(i)^2);
end
step = 3;
arrayIndex =1;
for tetta=90:-step:0
    for phi = -90 :step: 90
        x(arrayIndex)  = h(arrayIndex).* sind(phi).*cosd(tetta);
        y(arrayIndex) =  h(arrayIndex).* cosd(tetta);
        z(arrayIndex) =  h(arrayIndex).* sind(phi).*sind(tetta);
        arrayIndex = arrayIndex + 1;
    end
end
for i =size - 1: -1 :2
    x(arrayIndex) = x(i)* - 1;
    y(arrayIndex) = y(i);
    z(arrayIndex) = z(i);
    arrayIndex = arrayIndex + 1;
end
writeResultToFile([x; y; z],'C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\reversed_norm.txt');
end

