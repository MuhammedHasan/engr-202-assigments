function [msg, encoded] = possibleMsg()
  msg = [[0 0 0 0]];
  msg = [msg; unique(perms ([1 0 0 0]),'rows')];
  msg = [msg; unique(perms ([1 1 0 0]),'rows')];
  msg = [msg; unique(perms ([1 1 1 0]),'rows')];
  msg = [msg; [1 1 1 1]];

  encoded = eye(16,12);
  for i= 1:length(msg)
    encoded(i,:) = conencode(int2str(msg(i,:)(:))(:)');
  end
end

[msg, encoded]= possibleMsg();
assert(length(msg),16)
assert(encoded(16,:),[1 1 0 1 1 0 1 0 0 1 1 1])
