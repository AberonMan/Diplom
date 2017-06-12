function [ angle ] = calculateAngle( perspectivePoint,point,quadr, normal)
%������ ����� � ����� 
point = rotatePointToNewBasis(point,-[normal(2),normal(1),normal(3)],-perspectivePoint);
%���������� �� ��  �����
pointOnPlane =  projectPoint(point,quadr.normal,[quadr.getX(),quadr.getY(),quadr.getZ()]);
shotVector  = pointOnPlane - perspectivePoint;
%������� ����
angle = acos(dot(shotVector,normal)/norm(shotVector));
% � ������� ���� �� ����� ���������� ��������� ����������
if (cos(angle) < 0)
    angle = angle + pi;
end
end

