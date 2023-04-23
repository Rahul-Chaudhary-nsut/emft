clear
x=0:0.01:8;
y=function2(x);
figure(1)
plot(x,y, 'LineWidth', 2)
axis([0 10 0 4])
xlabel('x variable') 
ylabel('y variable') 
Q = quad(@function2,0,8);
disp('Enter a increment size for the integral, recommended ');
disp(' 0.1 to 1 (the smaller the better, but');
dx=input('smaller requires more computation time)! ... >');
sum=0;
for x=0:dx:8,
 sum=sum+function2(x)*dx; 
end
disp('')
disp('The computed integrals of the function y(x) between');
disp(' x = 0 and x = 8 are')
disp(sprintf(' quad integral ='));
disp(sprintf(' %f\n custom summation integral = %f', Q, sum))
for x=0:dx:8,
 patch([x-dx/2; x-dx/2; x+dx/2; x+dx/2], ...
 [0; function2(x); function2(x); 0], [0.5 0.5 0.5])
end
hold on
x=0:0.01:8;
y=function2(x);
h=plot(x,y, 'LineWidth', 2) 
axis([0 10 0 4])
xlabel('x variable')
ylabel('y variable')
function y = function2(x) 
y = (-1/20)*x.^3+(3/5)*x.^2-2.1*x+4;
end