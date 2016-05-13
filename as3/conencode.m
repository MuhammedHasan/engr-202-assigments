function encoded = conencode(binaries)
  newBinaries =[];
  for i=1:(length(binaries) / 4)
    newBinaries = [newBinaries binaries(4 * i - 3:4 * i) ['0' '0']];
  end
  binaries = newBinaries;
  previous = 0;
  preprevious = 0;
  encoded = eye(1, length(binaries) * 2);
  for i = 1:length(binaries)
    current = str2num(binaries(i));
    encoded(2 * i - 1) = mod(current + previous + preprevious,2);
    encoded(2 * i) = mod(current + preprevious,2);
    preprevious = previous;
    previous = current;
  end
end

assert(conencode(['0' '0' '0' '1']), [0 0 0 0 0 0 1 1 1 0 1 1])
