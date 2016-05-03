function [chars,probability] = pmfOfText(txt)
  % pmf calculation for chars
  eachChars = '';
  counts = [];

  for i = txt
    indexOfChar = index(eachChars, i);
    if (indexOfChar == 0)
        eachChars = [eachChars i];
        counts = [counts 1];
    else
        counts(indexOfChar) = counts(indexOfChar) + 1;
    endif
  endfor

  probability= (counts/sum(counts))
  chars = eachChars
end
