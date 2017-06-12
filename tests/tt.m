step = 8;
iL = floor(90/step) + 1;
jL = floor(180/step) + 1;
phi = [];
tetta = [];
delimiterIn = '\t';
h = dlmread('C:\Users\1\Desktop\�����\������\�����\result\data\5_48.txt');
for i=1:1:iL
    phi =[phi linspace(-180,0,jL)];
    tetta = [tetta ones(1,jL)*(90 - (i-1)*step)];
end
h =  reshape( h.',1,numel(h));
x  = h.* cosd(phi).*sind(tetta);
y =  h.* cosd(tetta);
z =  h.* sind(phi).*sind(tetta);


%             �������� ���������� ����������, �������� ������ ����� �����
arrayIndex = length(x) + 1;
for i =length(x) - 1: -1 :2
    x(arrayIndex) = x(i);
    y(arrayIndex) = y(i);
    z(arrayIndex) = z(i)* -1;
    arrayIndex = arrayIndex + 1;
end
%             ������ �����������, � ������� ���������
writeResultToFile([x; y; z],'C:\Users\1\Desktop\�����\������\�����\result\data\calculation_norm.txt');
[xS,yS,zS] =sphere;
plotCaclulatedArmored(x, y, z,xS,yS,zS);