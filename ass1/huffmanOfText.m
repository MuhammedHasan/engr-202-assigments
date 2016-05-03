function [chars,huff] = huffmanOfText(txt)
  % Q3
  % huffmen coding of text
  % huffmandict in communications octave package used
  pkg load communications
  [chars,prob] = pmfOfText(txt)
  huff = huffmandict(chars, prob)
end
