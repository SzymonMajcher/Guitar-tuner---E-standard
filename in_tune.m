function in_tune(correct_tune)
    i=0
    while i < 30
        i=i+1;
        recObj = audiorecorder(44100, 16, 1);
        get(recObj);
        recordblocking(recObj, 0.5);
        myRecording = getaudiodata(recObj);
        f0 = pitch(myRecording,44100);
        actual_tune = mode(f0) 
        if (actual_tune > correct_tune+0.5)
            disp("too high")
        elseif (actual_tune < correct_tune-0.5)
            disp("too low")
        else
            disp("Correct")
            %break;
        end

    end