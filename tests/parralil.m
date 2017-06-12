
deltaX = 5;
deltaY = 6;
deltaZ = 8;

x=[
    -1 1 1 -1 -1 % bottom
    -1 1 1 -1 -1 % top
    -1 -1 -1 -1 -1 % left
    1 1 1 1 1 % right
    ] * deltaX;
y=[
    -1 -1 1 1 -1
    -1 -1 1 1 -1
    -1 1 1 -1 -1
    -1 1 1 -1 -1
    ] *deltaY ;
z=[
    -1 -1 -1 -1 -1
    1 1 1 1 1
    -1 -1 1 1 -1
    -1 -1 1 1 -1
    ] * deltaZ;
figure;
line(x',y',z');
view(3);
set(gca,'xlim',[-10 10],...
    'ylim',[-10 10],...
    'zlim',[-10 10]);
xlabel('XXX');
ylabel('YYY');
zlabel('ZZZ');