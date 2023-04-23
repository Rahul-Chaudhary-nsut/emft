clear
syms x y z 
disp('Enter the symbolic vector');
A=input('(in the format [fx(x,y,z) fy(x,y,z) fz(x,y,z)])...   \n>  ');

divA=diff(A(1),x)+diff(A(2),y)+diff(A(3),z)
subs(divA,{x,y,z},{1,-2,3})

curlA=[diff(A(3),y)-diff(A(2),z),-diff(A(3),x)+diff(A(1),z),diff(A(2),x)-diff(A(1),y)]
subs(curlA,{x,y,z},{1,-2,3});