clear
disp('Enter the relative permittivity in the region ');
er1 = input(' z > 0... \n > ');
if isempty(er1); er1 = 1; elseif er1 < 1; er1 = 1; end 
disp('Enter the relative permittivity in the region ');
er2 = input(' z < 0... \n > ');
if isempty(er2); er2 = 1; elseif er2 < 1; er2 = 1; end 
disp('Enter the side of the interface where the electric');
side = input('field is known (given)... \n > ');
if isempty(side); side = 1; elseif side > 2; side = 2; end  
if side == 1;
 disp('Enter the electric field in side 1 in the ');
 E1 = input(' form [Ex Ey Ez]... \n >');
 E1n = E1(3)*[0 0 1];
 E2n = E1n*er1/er2;
 E1t = E1 - E1n;
 E2t = E1t;
 E2 = E2t + E2n;
elseif side == 2;
 disp('Enter the electric field in side 2 in the '); 
 E2 = input(' form [Ex Ey Ez]... \n >');
 E2n = E2(3)*[0 0 1];
 E1n = E2n*er2/er1;
 E2t = E2 - E2n;
E1t = E2t; 
 E1 = E1t + E1n;
else
 disp('Invalid specification, please re-try \n');
 end
disp(sprintf('The electric fields are '));
disp(sprintf('\n E1 = (%d, %d, %d) V/m',E1(1), E1(2), E1(3)));
disp(sprintf('\n E2 = (%d, %d, %d) V/m',E2(1), E2(2), E2(3)));