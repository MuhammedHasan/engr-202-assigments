% % For this homework octave 4.0.0 used
% % Also communications package of octave used for huffman part
% % Code are writen as function to diffrent file for code organization.
% % Those code called from there to printing result.
clc
clear all
close all
disp('============================= ASSIGNMENT # =======================');
disp('Name: Muhammed Hasan');
disp('Surname: Celik');
disp('Student ID: 213960832');
disp(' ');
disp('Press any key to continue');
pause
disp('=============================  SECTION A =========================');
disp(' PART 1');
disp(' ');

fid = fopen ('prove.txt');
txt = fgetl (fid);
fclose (fid);

[chars,inf] = infOfText(txt);
for i = 1:length(inf)
  fprintf(chars(i));
  disp(inf(i));
endfor

disp('Press any key to continue');
pause
disp(' PART 2');
disp(' ');

ent = entropyOfText(txt);
disp(ent);

disp('Press any key to continue');
pause
disp(' PART 3');
disp(' ');

[chars, huff] = huffmanOfText(txt)
for i = 1:length(chars)
  fprintf(chars(i));
  disp(huff{1,i});
endfor

disp('Press any key to continue');
pause
disp(' PART 4');
disp(' ');

expLen = expectedLenText(txt);
disp(expLen);
disp('Every time entropy smaller then expected length');
fprintf('Differance between entropy and expected length = ');
disp(expLen - ent);

disp('Press any key to continue');
pause
disp(' PART 5');
disp(' ');

huffEncoded = huffEncodeText(txt)
disp(huffEncoded)

disp('Press any key to continue');
pause
disp(' PART 6');
disp(' ');
disp('This is hardcode thus slow a little bit');
huffDecoded = huffDecodeText(huffEncoded, chars, huff)
disp(huffDecoded)

disp('Press any key to continue');
pause
disp('=============================  SECTION B =========================');
disp(' PART 1');
disp(' ');

disp('Hardcode thus slow a little bit');
[lzwEncoded, tableOflzw] = LZWEncodeText(txt)
disp(lzwEncoded)

disp('Press any key to continue');
pause
disp(' PART 2');
disp(' ');

fprintf('LZW encode it in')
disp(length(lzwEncoded));

fprintf('Huffman encode it in')
disp(length(huffEncoded));

fprintf('Fixed lenght encode it in')
disp(length(txt) * 8);

disp('For this dataset')
disp('Huffman is better then LZW and LZW is better and fixed lenght ')

disp('Press any key to continue');
pause
disp(' PART 3');
disp(' ');

 lzwDecoded = LZWDecodeText(lzwEncoded)
disp(lzwDecoded)

disp('Press any key to continue');
pause
