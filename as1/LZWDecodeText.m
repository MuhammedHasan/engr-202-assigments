function lzwDecoded = LZWDecodeText(binary)
  % Q3
  % LZW encoding
  % Hardcode thus slow a little bit
  symbols = struct();
  lzwDecoded = []
  nextSymbolAscii = 256
  previous = ''
  for i = 0:(length(binary)/10)
    binOfChar = binary((i*10+1):((i+1)*10))
    if isfield(symbols, binOfChar)
      lzwDecoded = [lzwDecoded symbols.(binOfChar)]
    else
      lzwDecoded = [lzwDecoded char(bin2dec(binOfChar))]
    endif
    if i ~= 0
        symbols([lzwDecoded previous]) = dec2bin(nextSymbolAscii)
        nextSymbolAscii++
    endif
    previous = lzwDecoded
  endfor
endfunction
