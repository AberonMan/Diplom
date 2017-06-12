function prettySurfacePrint( filename,depth )
warning off;
[x,y,z] = loadResultFromFile(filename);
[Xs,Ys,Zs] = sphere;
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
plotCaclulatedArmored(xOut * -1,yOut,zOut,Xs*depth,Ys*depth,Zs*depth);


end

