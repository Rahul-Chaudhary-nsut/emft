clear
n = input('Enter number of charges in the system... \n > ');
if isempty(n); n = 1; end
Q=zeros(n,4); 
r=input('Enter observation location [x y z]... \n > ');
if isempty(r); 
    r = [0 0 0]; 
end
for index=1:n
 disp(sprintf('Enter position of charge number '));
 disp(sprintf('%d in the format [x y z]...',index));
 Q(index,1:3) = input('> ');
 disp(sprintf('Enter the charge value of charge '));
 disp(sprintf('number %d...',index));
 Q(index,4) = input('> ');
end
Etotal=0;
for index=1:n
 rtemp=r-Q(index,1:3);
 rtemp_unitvector = rtemp/norm(rtemp);
 Etemp=Q(index,4)/(4*pi*8.86e-12*(norm(rtemp))^2)*rtemp_unitvector;
 Etotal=Etemp+Etotal;
end
disp(sprintf('The total electric field at point [x y z] '))
disp(sprintf(' = [%d %d %d] is ', r(1), r(2), r(3)))
Etotal