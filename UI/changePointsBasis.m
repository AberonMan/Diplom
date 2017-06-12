function [ points] = changePointsBasis( points,planeNorm,planePoint )
points = arrayfun(@(point) rotatePointToNewBasis(cell2mat(point),planeNorm , planePoint)...
    ,points, 'UniformOutput',false);


end

