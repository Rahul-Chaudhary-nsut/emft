clear
w1 = 0.2e-3;
w2 = 2.5e-3;
cond = 6.5e5;
t = 15e-6;
l = 8e-3;
sum=0;
dz=l/1000;
for z=0:dz:l,
 sum=sum+1/(w2*cond*t)*exp(-1/l*log(w1/w2)*z)*dz; 
end
disp('')
disp(sprintf('The total resistance of the trace is %f', sum))