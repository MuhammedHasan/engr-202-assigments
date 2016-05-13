function decoded = viterbiDecoder(encodeBinary)
  decoded = [];
  [posMsg,posEncodeMsg] = possibleMsg();
  for i = 1:(length(encodeBinary) / 12)
    msg = encodeBinary(12 * i - 11: 12 * i);
    for j=1:length(posMsg)
      if posEncodeMsg(j,:) == msg
        decoded = [decoded posMsg(j,:)];
      end
    end
  end
end

encodedMsg = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 1];
assert(viterbiDecoder(encodedMsg), [0 0 0 0 0 0 0 1])
