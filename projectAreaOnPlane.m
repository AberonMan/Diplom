function projectedArea = projectAreaOnPlane(area, planeNorm , planePoint )
projectedArea = arrayfun(@(point) projectPoint(cell2mat(point),planeNorm , planePoint)...
    ,area, 'UniformOutput',false);
end



