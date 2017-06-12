u = [-0.992401725546520 -0.123036975199443 0.000847269769111767];
planePoint = [-1000 0 0];
v = [-u(1),0,u(3)];
w = cross(u,v);
uN = u/norm(u);
vN = v/norm(v);
wN = w/norm(w);
P = dot(planePoint,vN)*vN + dot(planePoint,uN)*uN + dot(planePoint,wN)*wN;