clear all

Fs = 44100;
L= 44100;
recObj = audiorecorder(44100, 16, 1);
get(recObj)
disp('Start speaking.')
recordblocking(recObj, 1);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

i = 0;
array = [];
for j=1:44100
    if myRecording(j) < -0.05 || myRecording(j) > 0.05
        i = i+1 
        array(i) = myRecording(j);
    end
end
array = array';
% Plot the waveform.
plot(array);
f0 = pitch(myRecording,44100)
sound = mean(f0)
sound_2 = mode(f0)

%n = input('Enter a string number: ');
n = 1;
switch n
    case 1
        disp('E4')
        in_tune(sound, 329.6)
    case 2
        disp('B3')
        in_tune(sound, 246,9)
    case 3
        disp('G3')
        in_tune(sound, 196)
    case 4
        disp('D3')
        in_tune(sound, 146,8)
    case 5
        disp('A2')
        in_tune(sound, 110)
    case 6
        disp('E2')
        in_tune(sound, 82,4)
    otherwise
        disp('Thats illegal')
end