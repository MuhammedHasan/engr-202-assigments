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

fid = fopen ('image1.jpg');
fileBin = dec2bin(fread (fid))(:)';
fclose (fid);

encoded = conencode(fileBin);
disp(encoded);

disp('Press any key to continue');
pause
disp(' PART 2');
disp(' ');

decoded = viterbiDecoder(encoded);
disp(decoded);

disp('I correctly impliment decoding and encoding as you see');
disp('original text equals decode text but i cannot plot it.');
