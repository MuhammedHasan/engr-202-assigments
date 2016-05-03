function expLen = expectedLenText(txt)
  [chars,huff] = huffmanOfText(txt)
  expLens = []
  [chars,prob] = pmfOfText(txt)
  for i = 1:length(chars)
    expLens(i) = length(huff{1,i})
  endfor
  expLen = sum(prob.*expLens)
end
