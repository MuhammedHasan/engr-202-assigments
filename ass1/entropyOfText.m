function ent = entropyOfText(txt)
  % Q2
  % entropy calculcation
  [chars,prob] = pmfOfText(txt)
  [chars,inf] = infOfText(txt)
  ent = sum(inf.*prob)
end
