clear
% Enter the frequency (in rad/s)
a = input('Enter the waveguide width\n > ');
% Enter the propagation constant gamma (in a+j*b format)
b = input('Enter the waveguide height\n > ');
% Enter the relative permittivity 
er = input('Enter the relative permittivity \n > ');
% Enter the propagation constant gamma (in a+j*b format)
ur = input('Enter the relative permeability\n > ');
index=1; % start a count
for m=1:10,
 for n=1:10,
 modes(index,1)=1; % store a 1 in row <index>, and 
 % column 1 for TM modes
 modes(index,2)=m; % store m in row <index>, and column 2 
 modes(index,3)=n; % store n in row <index>, and column 3 
 modes(index,4)=3e8/sqrt(er*ur)*sqrt((m*pi/a)^2+(n*pi/b)^2);
 % store cutoff in row <index>, and column 4 
 index=index+1; % increment counter
 end
end
% Determine the first 100 TE modes
for m=0:9,
 for n=0:9,
 if m | n % check if either m or n is nonzero and 
 % compute mode
 modes(index,1)=2; 
 modes(index,2)=m;
 modes(index,3)=n;
 modes(index,4)=3e8/sqrt(er*ur)*sqrt((m*pi/a)^2+(n*pi/b)^2);
 index=index+1;
 else
 % do nothing, because m = n = 0
 end
 end
end
modes=sortrows(modes,4);
mode_string='ME';
disp(sprintf('\n'));
for k = 1:10
 disp(sprintf('Mode: T%c%d%d, ',...
 mode_string(modes(k,1)),modes(k,2), modes(k,3))) 
 disp(sprintf('Cutoff frequency = %0.3f GHz\n',...
 modes(k,4)/(2*pi*1e9)))
end