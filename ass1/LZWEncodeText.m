function [lzwEncoded, tableOflzw] = LZWEncodeText(txt, bicLength)
  % Q1
  % LZW encoding
  % Hardcode thus slow a little bit
  symbols = struct();
  nextSymbolAscii = 256
  lzwEncoded = []
  i = 1
  while length(txt) >= i
    [encoded, newSymbol, numOfEncoded] = lzwEncodeChar(i,txt,symbols)

    if i ~= length(txt)
      symbols.(newSymbol) = dec2bin(nextSymbolAscii++,10)
    endif

    lzwEncoded = [lzwEncoded encoded]
    i += numOfEncoded
  endwhile

  tableOflzw = symbols
endfunction

function [encoded,newSymbol,numOfEncoded] = lzwEncodeChar(char_index,txt,symbols)
  j = 1;
  while length(txt) > char_index+j
    if isfield(symbols,txt(char_index:char_index+j))
      j++;
    else
      break
    endif
  endwhile

  numOfEncoded = j
  pattern = txt(char_index: char_index + j - 1)
  encoded = lzwEncodePattern(pattern,symbols,10)

  if length(txt) >= char_index+j
    newSymbol = txt(char_index:char_index+j)
  endif

endfunction

function encodedPattern = lzwEncodePattern(pattern, symbols)
  if length(pattern) == 1
    encodedPattern = dec2bin(toascii(pattern), 10)
  else
    encodedPattern = symbols.(pattern)
  endif
endfunction

% tests
% testText = 'thisisthe'
% lzwEncoded = LZWEncodeText(testText)
% assert(length(lzwEncoded),63)
