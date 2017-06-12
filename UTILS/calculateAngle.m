function [ angle ] = calculateAngle( perspectivePoint,point,quadr, normal)
%Меняем базис у точки 
point = rotatePointToNewBasis(point,-[normal(2),normal(1),normal(3)],-perspectivePoint);
%Проецируем ее на  грань
pointOnPlane =  projectPoint(point,quadr.normal,[quadr.getX(),quadr.getY(),quadr.getZ()]);
shotVector  = pointOnPlane - perspectivePoint;
%Находим угол
angle = acos(dot(shotVector,normal)/norm(shotVector));
% В вслучае если он тупой пользуемся формулами привидения
if (cos(angle) < 0)
    angle = angle + pi;
end
end

