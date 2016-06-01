function transmitterreceiver= createTransmitterReceiver(bitAmounts)
  for i = 1:length(bitAmounts)
    transmitterreceiver{i} = randi([0 1], bitAmounts(i) ,1)';
  end
end

tr =  createTransmitterReceiver([2 3 4]);
assert(length(tr{1}), 2);
assert(length(tr{2}), 3);
assert(length(tr{3}), 4);
