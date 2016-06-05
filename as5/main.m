% For this homework octave 4.0.0 used
clc
clear all
close all
disp('============================= ASSIGNMENT #5 =======================');
disp('Name: Muhammed Hasan');
disp('Surname: Celik');
disp('Student ID: 213960832');
disp(' ');
disp('Press any key to continue');
pause

Text = 'EECS-202 - Basic Digital Communication with Networking'
disp(' PART 1');
disp(' ');

frameTime = 5;
trPercentage = [.4 .3 .2 .1];
firstTr = createTransmitterReceiver([4500 2500 2000 1200])

disp('Press any key to continue');
pause
disp(' PART 2');
disp(' ');

switchNum = 3;
firstTrAfter = transmitteReceive(firstTr, frameTime, trPercentage, switchNum);
util = utilizationOfNetwork(firstTr,firstTrAfter,frameTime, switchNum)

disp('utilization Of Network is ');
disp(util);

disp('This result mean that only 0.68 perecentage of network used');
disp('Other 0.32 perecentage of network was wasted');
disp(15000 * util);
disp(' bit is used and');

disp(15000 * (1-util));
disp(' bit is wasted');
disp('');

disp('Press any key to continue');
pause
disp(' PART 3');
disp(' ');

switchNum = 2;
firstTrAfter = transmitteReceive(firstTr, frameTime, trPercentage, switchNum);

disp('Utilization is');
util = utilizationOfNetwork(firstTr,firstTrAfter,frameTime, switchNum);
disp(util);

disp(10000 * util);
disp(' bit is used and');

disp(10000 * (1-util));
disp(' bit is wasted');
disp('');

disp('This utilization result for 2 frame is better than for 3 frame');
disp('Because it give some bit transmitter receiver in 3 frame');
disp('Alhough they finish there bits or they do not need this much.');
disp('Their message smaller then network perecentage of frame for them');

disp('Press any key to continue');
pause
disp(' PART 4');
disp(' ');

secondTr = createTransmitterReceiver([4500 2500 2000 1200 5000 1000]);
trPercentage = [.25 .2 .15 .05 .3 .05];

switchNum = 3;
secondAfterTr = transmitteReceive(secondTr, frameTime, trPercentage, switchNum);

disp('Utilization is');
util = utilizationOfNetwork(secondTr, secondAfterTr, frameTime, switchNum);
disp(util);

disp(15000 * util);
disp(' bit is used and');

disp(15000 * (1-util));
disp(' bit is wasted');
disp('');

disp('This utilization result is better than part 2 and part 3');
disp('Because sum of total bit 16200');
disp('But for part 2 it is 10200');
disp('For 15000 bit network size, 4800 will be never used.');
disp('Because message too small for network size.');
disp('This decrease utilization a lot');
disp('Also it is better than part 3 because');
disp('it has more transmitter receiver with better perecentages.');


disp('Press any key to continue');
pause
disp(' PART 5');
disp(' ');

utilForDifferentFrameTime = [];
switchNum = 3;
for i = 1:10
  firstTrAfter = transmitteReceive(firstTr, i, trPercentage, switchNum);
  utilForDifferentFrameTime(i) = utilizationOfNetwork(firstTr,firstTrAfter,i, switchNum);
end

disp();
plot(utilForDifferentFrameTime);
pause

disp('For less frame time utilization is better beacuse there is less fragmation.');
disp('Having empty part of frame is fragmation because message ended.');
disp('For less frame time mean less fragmation that mean better utilization.');
