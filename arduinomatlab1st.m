clear
clc
close all
ledPin='D13';
blink=0.5;

a = arduino('COM7','Leonardo', 'Libraries', 'Servo');
s=servo(a, 'D3');
for k=1:10
    a.writeDigitalPin(ledPin, 0);
    pause(blink/2);
    a.writeDigitalPin(ledPin, 1);
    pause(blink/2);
end

for angle=0:0.1:1
    writePosition(s,angle);
    currentPos=readPosition(s);
    currentPos=currentPos*180;
    fprintf('Current position is %d degree\n', currentPos);
    pause(2);
end