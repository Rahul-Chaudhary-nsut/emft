clear 
syms w Z0 ZL ZG VG gamma z Zin 

wn = input('Enter the angular frequency\n > '); 

gamman = input('Enter the propagation constant\n > '); 

L = input('Enter the length\n > '); 

Z0n = input('Enter the characteristic impedance\n > '); 
 
disp('Enter the complex load impedance '); 
ZLn = input('(in a+j*b format)\n > '); 

disp('Enter the complex source impedance '); 
ZGn = input('(in a+j*b format)\n > '); 

disp('Enter the source voltage '); 
VGn = input(' (in a*exp(j*b) format)\n > '); 

Zin = Z0*(ZL - Z0 * tanh(gamma *z)) / (Z0 - ... 
 ZL * tanh(gamma * z)); 

GammaL = (ZLn - Z0n) / (ZLn + Z0n); 
disp(' \n The reflection coefficient at the load is'); 
disp(sprintf(' %0.2f+j%0.2f\n',real(GammaL), imag(GammaL))) 


SWR=(1+abs(GammaL))/(1-abs(GammaL)); 
disp(sprintf('The SWR at the load is %0.2f\n', SWR))
ZinG=subs(Zin,{Z0,ZL,gamma,z},{Z0n,ZLn, gamman,L}); 
disp('The input impedance seen by the generator ') 
disp(sprintf(' is %0.2f+j%0.2f\n', real(ZinG), imag(ZinG))) 
 
V0G = VGn * ZinG / (ZGn + ZinG);  
V0plus = V0G * exp(-gamman*L)/(1 + GammaL *exp(-2*gamman*L)); 
 
z=-L:L/1000:0;  
Vz = V0plus*exp(gamman*z).*(1 + GammaL*exp(2*gamman*z));  

Iz = V0plus/Z0n*exp(gamman*z).*(1 - GammaL*exp(2*gamman*z));  
 
figure 
subplot(2,1,1)  
plot(z, abs(Vz)) 
axis([double(-L) double(0) double(0) double(abs(2*V0plus))]) 
title('Voltage on transmission line as a function of length') 
xlabel('distance from load (m)') 
ylabel('magnitude of voltage (V)') 
subplot(2,1,2) 
plot(z, abs(Iz)) % plot only current magnitude 
axis([double(-L) double(0) double(0) double(abs(2*V0plus/Z0n))]) 
title('Current on transmission line as a function of length') 
xlabel('distance from load (m)') 
ylabel('magnitude of current (A)')