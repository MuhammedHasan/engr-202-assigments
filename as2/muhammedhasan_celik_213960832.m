% % For this homework octave 4.0.0 used
clc
clear all
close all
disp('============================= ASSIGNMENT #2 =======================');
disp('Name: Muhammed Hasan');
disp('Surname: Celik');
disp('Student ID: 213960832');
disp(' ');
disp('Press any key to continue');
pause

Text = 'EECS-202 - Basic Digital Communication with Networking'
disp(' PART 1');
disp(' ');

disp('This coding is channel coding that check that');
disp('if data is transfered corrently or not.');
disp('For this idea, we need add prity bit in our original code.');
disp('This bit check correction but it increase lenght of code.');

disp('Press any key to continue');
pause
disp(' PART 2');
disp(' ');

A = [1 1 0 1 0 1 0 0 1 1 1;
     0 1 1 0 1 1 1 1 1 0 0;
     0 0 1 1 0 0 1 1 1 1 1;
     0 1 0 1 1 0 1 1 1 1 0]

G = [eye(11) A']
disp('colums 12 to 15 represent matrix A');

disp('Press any key to continue');
pause
disp(' PART 3');
disp(' ');

H = [A eye(4)]

disp('Syndromes')

for i = 1:size(H)(2)
  disp(H(:,i));
  disp(' ');
endfor

disp('Press any key to continue');
pause
disp(' PART 4');
disp(' ');

binOfText = dec2bin(double(Text))'(:)' - '0'
binOfTextMatrix = reshape([binOfText 0 0 0 0 0 0 0], [11, 35])'
encodedMsg = logical(binOfTextMatrix * G)
disp('I expect to get ');
disp(11 * 35);
disp('bit');

disp('Press any key to continue');
pause
disp(' PART 5');
disp(' ');

interleavedMsg = encodedMsg(:)'

disp('Press any key to continue');
pause
disp(' PART 6');
disp(' ');

randomNumber = dec2bin(randi([1,100])) - '0'
syncPattern = [1 0 0 0 0 0 0 0 0 0 0 0 1]
framedMsg = [randomNumber syncPattern interleavedMsg]

disp('Press any key to continue');
pause
disp(' PART 7');
disp(' ');

errorAddedMsg= framedMsg
errorAddedMsg(200:224) = ~framedMsg(200:224)


disp('Press any key to continue');
pause
disp(' PART 8');
disp(' ');

startOfFrame = findstr(errorAddedMsg, syncPattern)
deFramedMsg = errorAddedMsg(size(syncPattern)(2)+startOfFrame:size(errorAddedMsg)(2))

disp('Press any key to continue');
pause
disp(' PART 9');
disp(' ');

deInterleaving = reshape(deFramedMsg,[35, 15])

disp('Press any key to continue');
pause
disp(' PART 10');
disp(' ');

decodeTextBinary = []
for i = 1:size(deInterleaving)(1)
  di = deInterleaving(i,:)'
  mdi = logical(H * di)
  for j = 1:size(H)(2)
    if mdi == H(:,j)
      di(j,:)
      di(j,:) = ~di(j,:)
      decodeTextBinary = [decodeTextBinary di']
    endif
  endfor
endfor

disp(decodeTextBinary)

decodeText = []

for i = 1:(size(decodeTextBinary)(2)/7)
  range = ((i-1)*7)+1:((i-1)*7)+1+6
  decodeText = [decodeText char(bin2dec(num2str(decodeTextBinary(range)))) ]
endfor

disp('I cannot get original text but only fisrt char is corrent');
