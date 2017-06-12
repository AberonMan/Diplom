function [ averageThick ] = calculateArmor(obj,n,distributionType, additionalParam,i,j,quads,r,step,~ )
coder.inline('never');
center = [0,150,0];
tetta = 90 - (i -1)*step;
phi = -180 + (j-1)*step;
perspective = [r * sind(tetta)*cosd(phi),  r*cosd(tetta),...
    r*sind(tetta)*sind(phi)];
viewVector = getViewVector(obj,perspective,center);

%                   ������� �� ����� ������ ������� �� ����� �� ������
%                   ���� ����������� (��� ������� �
%                   ���� ��, ��� �� �������� �����
%                   ������� ������� �� ��� �������
%                   ������� �����.
planeNorm = viewVector / norm(viewVector);
visibleQuads = obj.getVisibleQuads(planeNorm,quads);

% hold on;
%  for i =1:1: length(visibleQuads)
%      visibleQuads(i).plotQuadrangle(1);
%  end
% hold off;

% �������� ������� � ��������� ���������
planeNorm = viewVector / norm(viewVector);
planePoint = perspective;

% figure
[x,z] =prepareDateForRandomPointsGeneration(visibleQuads,planeNorm,planePoint);
if (strcmp(distributionType,'norm'))
    sigma = additionalParam;
    % ��������� ����� ��  ����������� ������
    [ randX, randY,randZ ] = generateNormalDistributedPoints(x,z, n,sigma);
else          % ��������� ����� ��  ������������ ������
    [ randX, randY,randZ ] = generateUniformDistributedPoints(x,z,n);
end
totalThick = 0;
counter = 0;
%                     ������������ ����� � �������� ������� ����
for i =1:1:length(visibleQuads)
    currentQuad = visibleQuads(i);
    size = length(randX);
    for j =size:-1:1
        if (inside(currentQuad,randX(j),randY(j),randZ(j),planeNorm,planePoint))
            counter = counter + 1;
            % ��������� ���� ��� ������� ��������� ��
            angle = calculateAngle(perspective,[ randX(j),randY(j),randZ(j)],currentQuad,planeNorm);
            totalThick = (totalThick + currentQuad.armorThickness/cos(angle));
            randX(j) = [];
            randY(j) = [];
            randZ(j) = [];
        end
    end
end
averageThick = totalThick/counter;
% �����������  ��������� ������������
% averageThick = totalThick/counter;
% x(arrayIndex)  = averageThick.* sind(phi).*cosd(tetta);
% y(arrayIndex) =  averageThick.* cosd(tetta);
% z(arrayIndex) =  averageThick.* sind(phi).*sind(tetta);
% arrayIndex = arrayIndex + 1;
% %        ������� ���������� ����� � ������� ����������� �����������.
% if (tetta == 0)
%     break;
% end

end

