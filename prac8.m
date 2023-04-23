clear 
syms at ax ay az t  

at=[ax, ay, az]; 
a=[12, 10, 0]*3/2; 
 
disp(sprintf('Part a\nThe acceleration ')) 
disp(sprintf('is (%f, %f, %f) m/s', a(1), a(2), a(3))) 
 

v=[dsolve('Dvx=ax','vx(0)=4','t'),
 dsolve('Dvy=ay','vy(0)=0','t'),
 dsolve('Dvz=az','vz(0)=3','t')]; 
v=subs(v,{ax,ay,az},{a(1), a(2), a(3)}); 
disp(sprintf('\n\nPart b\nThe general velocity is given by'))  

pretty(v) 
v=subs(v,{t},1); 
disp('The velocity at (1, -2, 0) is '); 
disp(sprintf('(%f, %f, %f) m/s', v(1), v(2), v(3))) 
 
disp('\n\nPart c\nThe kinetic energy ')
disp(sprintf('is %f J',0.5*2*norm(v)^2))  


p=[dsolve('D2px=ax','px(0)=1','Dpx(0)=4','t'),dsolve('D2py=ay','py(0)=-2','Dpy(0)=0','t'),dsolve('D2pz=az','pz(0)=0','Dpz(0)=3','t')];  

p=subs(p,{ax,ay,az},{a(1), a(2), a(3)}); 
disp(sprintf('\n\nPart d\nThe general position is given by'))
 
pretty(p) 
p=subs(p,{t},1); 
disp('The position at time t = 1 s '); 
disp(sprintf(' is (%f, %f, %f) m/s', p(1), p(2), p(3)))