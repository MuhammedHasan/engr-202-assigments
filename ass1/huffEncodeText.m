function huffEncoded = huffEncodeText(txt)
  % Q5
  % Huffman encoding for text
  [chars,huff] = huffmanOfText(txt)
  indexOfChar = []
  for i = txt
    indexOfChar = [indexOfChar index(chars, i)];
  endfor
  huffEncoded = [huff{1,indexOfChar}]
end
