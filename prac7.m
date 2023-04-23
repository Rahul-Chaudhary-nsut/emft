% This script assists with the solution and graphing of Example 10.1
% We use symbolic variables in the creation of the waveform equation
% that describes the expression for the electric field
clear
syms E omega Beta t x  %symbolic variables for fields,
% time, and frequency
% Enter the frequency (in rad/s)
w = 10e8;
% The expression for the y-component of the electric field
E = 50*cos(w*t+Beta*x);
% part (b)
% solve for Beta
B = w/3e8; % B is the numeric variable for Beta,
% with value as calculated here
E = subs(E,Beta,B); % substitute the value B in for
% variable Beta
% Generate numerical sequence
xfinal=ceil(6*2*pi/B); % we will compute spatial values
% out to 3 wavelengths
dx=xfinal/1000; % the discrete distance
space=0:dx:xfinal; % create a vector of 1000 discrete space segments
unityvec=ones(1,length(space)); % create a vector of 1s that is
% the same length as the spatial vector discrete space
% Plot
figure
f = w/(2*pi); % determine the frequency
for time=0:1/(20*f):1/f % time loop - each iteration of this loop
    % will plot the e-field waveform for
    % a different increment of time we will loop
    % through exactly one wavelength
 
    En = subs(E,{x,t},{space,unityvec*time}); % substitute
    % the time and space vector into the variable
    En_numeric = double(En); % convert En to a numeric vector
    plot(space, En_numeric)
    axis([0 6*2*pi/B min(En_numeric)-10 max(En_numeric)+10])
    % add buffer space of 5 units to graph
    xlabel('x-axis (m)')
    ylabel('y-axis (m)')
    str=strcat('time = ', num2str(time), ' (s)');
    % concatenate string ‟time = ‟ to the actual time
    text(1.5, max(En_numeric)+5, str) % put annotation on figure
    % to show time
    pause(0.5) % pause for half a second then re-draw
    hold off
end