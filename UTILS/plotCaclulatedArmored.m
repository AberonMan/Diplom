function  plotCaclulatedArmored( x, y, z,xS, yS, zS )
z = z.';
x = x.';
y = y.';
tri = delaunay(z,x);
hold on;
trisurf(tri,z,x,y);
shading interp;
plot3(z,x,y,'.','MarkerSize',15);
surf(zS, xS,yS); %nonuniform
xlabel('z');
ylabel('x');
zlabel('y');
axis tight;
view(3);
axis vis3d image, box on, grid on
camlight, lighting phong, alpha(.8)
zoom on;
zoom(1.009);
end

