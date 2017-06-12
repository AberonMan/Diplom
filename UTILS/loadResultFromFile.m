function [ x,y,z ] = loadResultFromFile( filename )
fileID = fopen(filename);
formatSpec = 'X:%f Y:%f Z:%f  '  ;
result = cell2mat(textscan(fileID,formatSpec,...
    'Delimiter', '\n', ...
    'CollectOutput', true));
x = result(:,1)'*-1;
y = result(:,2)';
z = result(:,3)'*-1;
fclose(fileID);

end

