function utilization = utilizationOfNetwork(beforeTransfer, afterTransfer, frameTime, frameNumber)
  transferedBit = 0;

  for i = 1:length(beforeTransfer)
    transferedBit += length(beforeTransfer{i}) - length(afterTransfer{i});
  end

  maxBit = frameTime * frameNumber * 1000;
  utilization = transferedBit / maxBit;

end

frameTime = 5;
btr = createTransmitterReceiver([100 100 100 100 100]);
atr = transmitteReceiveOperation(btr, frameTime, [.1 .1 .1 .1 .1]);
u = utilizationOfNetwork(btr, atr, 5, 1);
assert(u, 500/5000);
