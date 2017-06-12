function  target = LoadTargetFromFile(filename)
fileContent = fileread(filename);
points = loadPoints(fileContent);
armorQuadrangle = loadArmorQuadrangles(fileContent,points);
agregates =   parseDefenslessAgregate(fileContent);
target = Target(armorQuadrangle,agregates);
end

function armorQuadrangles =  loadArmorQuadrangles(fileContent, points)
quadDescriptionRegexp = 'G\d+\s*=\s*[\(|\[](\s*\d+\s*,){3}(\s*\d+\s*)[\)|\]]\s*\[\d+\]';
quadTextDescription = regexp(fileContent,quadDescriptionRegexp,'match');
if(isempty(quadTextDescription))
    error('Invalid target file content, file  does not containt panes');
end
armorQuadrangles = ArmorQuadrangle.empty(0,length(quadTextDescription));
for i =1:1:length(quadTextDescription)
    digits = loadDigitFromDecriptions(quadTextDescription(i)); 
    numberIndex = 1;
    P1Index = 2;
    P2Index = 3;
    P3Index = 4;
    P4Index = 5;
    armorWidthIndex = 6;
    
    quadPoints = [points(digits(P1Index)),  points(digits(P2Index)),...
        points(digits(P3Index)), points(digits(P4Index))];
    armorQuadrangles(i) =  ArmorQuadrangle(digits(numberIndex),quadPoints,...
        digits(armorWidthIndex));
end



end

function points =  loadPoints(fileContent)
pointsDescriptionRegexp = 'P\d+\s*=\s*\[(\s*-?\d+.?\d*\s*,){2}(\s*-?\d+.?\d*\s*)\]';
pointsTextDescription = regexp(fileContent,pointsDescriptionRegexp,'match');
if(isempty(pointsTextDescription))
    error('Invalid target file content, file  does not containt points');
end

points = Point.empty(0,length(pointsTextDescription));
for i =1:1:length(pointsTextDescription)    
   digits = loadDigitFromDecriptions(pointsTextDescription(i));    
   numberIndex = 1;
   xIndex = 2;
   yIndex = 3;
   zIndex = 4;
   points(i) = Point(digits(numberIndex),  digits(xIndex), digits(yIndex),digits(zIndex));
end

[~, ind] = sort([points.number]);
points = points(ind);
end

 function agregates = parseDefenslessAgregate(fileContent)
 agregateRegexp = '\d+\.\d+\s*para3\s*\[(-?\s*\d+\s*,\s*){2}(-?\s*\d+\s*)\]\s+\((\s*\d+\s*,\s*){2}(\s*\d+\s*)\)\s*{h\((\d+\s*,\s*){3}\d+\s*\)}\s*<-?\d+(\.\d+)?\s*,\s*-?\d+>\s*''\w+''';
 agregatesData = regexp(fileContent,agregateRegexp,'match');
 agregates = [];
 for i =1:1:length(agregatesData)
     currentAgregateData = agregatesData(i);
     digits = loadDigitFromDecriptions(currentAgregateData);
     number = digits(1);
     armorQuad = loadAqrmorQuads(digits);
     name = loadAgregateName(currentAgregateData);
     agregates = [DefenselessAgregate(number,armorQuad,name) agregates ];
 end
 end

function digits = loadDigitFromDecriptions(descriptions)
digitsRegexp = '[-]?\d+(\.\d+)?';
 digitsCell =  regexp(descriptions,digitsRegexp,'match');
 digits = digitsCell{:};
 digits = cellfun(@str2num,digits);
end

function armQuads =  loadAqrmorQuads(digits)
     xCenter = digits(3);
     yCenter = digits(4);
     zCenter = digits(5);
     deltaX =  digits(6);
     deltaY =  digits(7);
     deltaZ =   digits(8);
     h(1:4) =   0;
     for k =9:12
         h(k-8) = digits(k);
     end
     armQuads = Quadrangle.loadQuadsFromCenter([xCenter yCenter zCenter],deltaX, deltaY, deltaZ,h);
end

function name =   loadAgregateName(content)
     nameRegexp = '''\w+''';
     nameCell =  regexp(content,nameRegexp,'match');
     name = nameCell(1);
end




