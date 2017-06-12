function [ x,z] = prepareDateForRandomPointsGeneration(quads,planeNorm,planePoint)
projectedPoints = cell(1,length(quads));
count = 0;
for i =1:1:length(quads)
    currentQuad = quads(i);
    points = projectAreaOnPlane(currentQuad.getPoints(),planeNorm,planePoint);
    points = changePointsBasis(points,planeNorm,planePoint);
    for j = 1:1:length(points)
    projectedPoints{count + j} = cell2mat(points(j));
    end
    count =count + length(points); 
end
x = cell2mat(cellfun(@(center) center(1),projectedPoints,'UniformOutput',false));
z = cell2mat(cellfun(@(center) center(3),projectedPoints,'UniformOutput',false));
end

