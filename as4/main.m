% % For this homework octave 4.0.0 used
clc
clear all
close all
disp('============================= ASSIGNMENT #3 =======================');
disp('Name: Muhammed Hasan');
disp('Surname: Celik');
disp('Student ID: 213960832');
disp(' ');
disp('Press any key to continue');
pause

Text = 'EECS-202 - Basic Digital Communication with Networking'
disp(' PART 1');
disp(' ');

Fs = 1000;
T = 1/Fs;
L = 1000;
t = (0:L-1)*T;

S = cos(2*pi*15*t) + cos(2*pi*25*t) + cos(2*pi*50*t)

plot(t,S);
pause

disp(' PART 2');
disp(' ');

plot(t,fft(S));
pause

disp(' PART 3');
disp(' ');
plot(t,fftshift(fft(S)));
pause

% transformedSignal = fft(generatedSignal)
%
%
%
%
% plot(timeInterval,fftshift(transformedSignal));
% pause
