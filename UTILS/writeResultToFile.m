function  writeResultToFile(result, filename )
fileID = fopen(filename,'w');
stringTemplate = 'X:%4.3f Y:%4.3f Z:%4.3f  \n';
fprintf(fileID,stringTemplate,result);
fclose(fileID);
end

