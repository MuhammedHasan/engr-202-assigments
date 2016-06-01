function generatedSignal = generateSignal(timeInterval)
  generatedSignal = cos(2*pi*15*timeInterval) + cos(2*pi*25*timeInterval) + cos(2*pi*50*timeInterval);
end
