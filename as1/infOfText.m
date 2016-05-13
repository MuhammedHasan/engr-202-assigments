function [chars,inf] = infOfText(txt)
  % Q1
  % Calculate information
  [chars,prob] = pmfOfText(txt)
  inf= log2(prob.^-1)
end
