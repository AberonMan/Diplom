function p =  dissectDataWithBreakeage(filename, depth )
w = warning ('off','all');
[x,y,z] = loadResultFromFile(filename);

wholeArea= caclArea( x,y,z );
xOut = [];
yOut = [];
zOut = [];
for i=1:1:length(x)
    if  (x(i)^2 + y(i)^2 + z(i)^2 >= depth^2  )
        xOut = [xOut x(i)];
        yOut = [yOut y(i)];
        zOut = [zOut z(i)];
    end
end
if (length(xOut) < 3)
    p =1;     return;
end
try
    outArea= caclArea(xOut,yOut,zOut);
catch  e
    p  = 1;
    return;
end
p = 1 - outArea/wholeArea;
end
