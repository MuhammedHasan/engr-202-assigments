function huffDecoded = huffDecodeText(binaries, chars, huff)
  % Q6
  % Huffmen Decoding
  % This is hardcode thus slow a little bit
  char_binary = [];
  huffDecoded = '';
  for i = binaries
    char_binary = [char_binary i];
    for j = 1:length(chars)
        if (isequal(huff{1,j},  char_binary))
          huffDecoded = [huffDecoded chars(j)];
          char_binary = [];
          break;
        endif
    endfor
  endfor
end
