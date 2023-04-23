clear
I=0.5e-3;
disp('Enter the observation point (in the ');
p0 = input('format [x y z])... \n > ');
if isempty(p0); p0 = [0 0 0]; end
xpstart = 0; xpend = 1e-2;
dxp=1e-7; 
H = [0, 0, 0]; 
zp = 0; 
for xp=xpstart:dxp:xpend, 
 yp=xp^2;
 dyp=(2*xp*dxp); 
 num = [(p0(3)-zp)*dyp,-(p0(3)-zp)*dxp,((p0(2)-yp)*dxp-...
 (p0(1)-xp)*dyp)]; 
 den = ((p0(1)-xp)^2+(p0(2)-yp)^2)^(3/2); 
 H = H + num/den;
end
H=H*(I/(4*pi));
disp('')
disp('The magnetic field at');
disp(sprintf(' (%f, %f, %f) cm \nis (%f %f %f) mA/m', ...
 p0(1), p0(2), p0(3), 1000*H(1), 1000*H(2), 1000*H(3)))



