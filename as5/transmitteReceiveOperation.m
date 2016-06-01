function updatedTransmitterReceiver = transmitteReceiveOperation(transmitterReceiver, frameTime, transmitterReceiverPercentage)
  transferForPerFrame = 1000 * frameTime;

  transferForPerUser = [];
  for i=1:length(transmitterReceiverPercentage)
    transferForPerUser(i) = transmitterReceiverPercentage(i) * transferForPerFrame;
  end

  for i = 1:length(transmitterReceiver)
    msg = transmitterReceiver{i};
    if length(msg) > transferForPerUser(i)
      updatedTransmitterReceiver{i} = msg(transferForPerUser(i) + 1:length(msg));
    else
      updatedTransmitterReceiver{i} = [];
    end
  end

end

transmitterReceiver = createTransmitterReceiver([1000 1000 1000 1000]);
updatedTransmitterReceiver = transmitteReceiveOperation(transmitterReceiver, 1, [.4 .1 .3 .2]);

assert(length(updatedTransmitterReceiver{1}), 600);
assert(length(updatedTransmitterReceiver{2}), 900);
assert(length(updatedTransmitterReceiver{3}), 700);
assert(length(updatedTransmitterReceiver{4}), 800);

transmitterReceiver = createTransmitterReceiver([1000 100 100 10]);
updatedTransmitterReceiver = transmitteReceiveOperation(transmitterReceiver, 1, [.4 .1 .3 .2]);
assert(length(updatedTransmitterReceiver{1}), 600);
assert(length(updatedTransmitterReceiver{2}), 0);
assert(length(updatedTransmitterReceiver{3}), 0);
assert(length(updatedTransmitterReceiver{4}), 0);
