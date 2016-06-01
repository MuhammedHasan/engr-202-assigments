function updatedTransmitterReceiver = transmitteReceive(transmitterReceiver, frameTime, transmitterReceiverPercentage, switchNum)
  updatedTransmitterReceiver = transmitterReceiver;
  for i = 1:switchNum
    updatedTransmitterReceiver = transmitteReceiveOperation(updatedTransmitterReceiver, frameTime, transmitterReceiverPercentage);
  end
end


transmitterReceiver = createTransmitterReceiver([5000 5000]);
updatedTransmitterReceiver = transmitteReceive(transmitterReceiver, 2, [.5 .5]);
assert(length(updatedTransmitterReceiver{1}), 0);
assert(length(updatedTransmitterReceiver{2}), 0);
