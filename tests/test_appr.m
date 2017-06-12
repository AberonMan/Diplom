[x,y,z ] =  loadResultFromFile('C:\Users\1\Desktop\Учеба\Диплом\Прога\result\data\calculation_norm.txt');
plot3(z,x,y,'.','MarkerSize',15);
xlabel('z');
ylabel('x');
zlabel('y');
axis tight;
view(3);
axis vis3d image, box on, grid on
camlight, lighting phong, alpha(.8)
zoom on;
zoom(1.009);