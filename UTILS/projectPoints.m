function [  randX, randY,randZ ] = projectPoints( randX, randY,randZ ,planeNorm , planePoint)

for i =1:1:length(randX)
    point = projectPoint([randX(i), randY(i),randZ(i)],planeNorm , planePoint );
    randX(i) = point(1);
    randY(i) = point(2);
    randZ(i) = point(3);
end


end

