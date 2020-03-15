function [ ] = CompactExperiment3( )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

    totalQuestions = 4;  % Change when the number of questions are changed, randomizer values also will be needed to change %
    hashTable = zeros(1, totalQuestions);
    timeArray = [];
    resultFile = fopen('results2.txt', 'a');
    typesFile = fopen('types2.txt', 'a');

    questionArr = {'Lutfen seciniz;'
                   'Lutfen seciniz;'
                   'Asagidaki kelime grubunun size cagristirdigi ilk duygu nedir?'
                   'Asagidaki kelime grubunun size cagristirdigi ilk duygu nedir?'

    };
   
    answerArrA = { 'A) 200 insanin yasamasi.'
                   'A) 400 kisinin olmesi.'
                   'Evlilik, Es, Olum'
                   'Kirilmis, Doku, Yatak'

    };

    answerArrB = { 'B) 1/3 olasilikla 600 insanin yasamasi ve 2/3 olasilikla kimsenin yasayamamasi.'
                   'B) 1/3 olasilikla hic kimsenin olmemesi ve 2/3 olasilikla 600 kisinin olmesi.'
                   ''
                   ''
    };

	Screen('Preference', 'SkipSyncTests', 1);    
    whichScreen = max(Screen('Screens'));
    [theWindow, theRect] = Screen('OpenWindow', whichScreen);

    Screen(theWindow,'FillRect', 0.5);
    Screen(theWindow,'DrawText', 'Deneye hosgeldiniz.',50,50,255);
    Screen(theWindow,'DrawText', 'Size, cevaplamaniz icin 4 tane soru verilecektir.',50,100,255);       
    Screen(theWindow,'DrawText', 'Cevabinizi klavyeden varsa a,b,c veya d tuslarina basarak ya da ',50,150,255);
    Screen(theWindow,'DrawText', 'tek kelimelik bir cevabý sesli söyleyerek verebilirsiniz.', 50,200,255);
    Screen(theWindow,'DrawText', 'Bazi sorularda secenekler bulunmuyor, bu sorulari cevapladiktan sonra ',50,250,255);
    Screen(theWindow,'DrawText', 'a,b,c veya d ye basarak gecebilirsiniz.',50,300,255);
    Screen(theWindow,'DrawText', 'Herhangi bir tusa basarak devam edebilirsiniz...',50,350,255);
    Screen('Flip', theWindow);

    HideCursor;

    KbWait;
    
    tic

    filePTR = fopen('start.txt', 'w');
    fprintf(filePTR, '1');
    fclose(filePTR);

    for i = 1:totalQuestions   
        randomizer = randi(totalQuestions);
        while hashTable(randomizer) == 1
            randomizer = randi(totalQuestions);
        end

        Screen(theWindow,'DrawText', char(strcat('', questionArr(randomizer))), 50,50,255);
        Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,100,255);
        Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,150,255);
        Screen('Flip', theWindow);

        if randomizer > 2
            fprintf(typesFile, '1,');
        else
            fprintf(typesFile, '2,');
        end

        waitSecs(1);


        while 1
            KbWait;
            [ keyIsDown, seconds, keyCode ] = KbCheck;
            keyCode = find(keyCode, 1);

            timeArray = [timeArray, toc];

            if keyIsDown && ((keyCode == 65) || (keyCode == 83) || (keyCode == 68) ||(keyCode == 70)) 
                KbName(keyCode); 
                fprintf(resultFile, char(strcat(questionArr(randomizer), ' --> ')));

                if keyCode == 65
                    fprintf(resultFile, char(strcat('', answerArrA(randomizer))));
                end
                if keyCode == 83
                    fprintf(resultFile, char(strcat('', answerArrA(randomizer))));
                end
                if keyCode == 68
                    fprintf(resultFile, char(strcat('', answerArrA(randomizer))));
                end
                if keyCode == 70
                    fprintf(resultFile, char(strcat('', answerArrA(randomizer))));
                end                        
                fprintf(resultFile, '\n');  
                break;
            end
        end

        hashTable(randomizer) = 1;
        waitSecs(1);
        
        if randomizer == 1
            stdDevValues = dlmread('stdDevValues.txt');
            stdDevPoints = dlmread('stdDevPoints.txt');

            val = dlmread('ExperimentVal.txt'); % This comes from the user's feedback live, read for demonstration purposes

            for j = 1 : 10
                tempArr = [val(stdDevPoints(1)) val(stdDevPoints(2)) val(stdDevPoints(3)) val(stdDevPoints(4)) val(stdDevPoints(5)) ...
                    (stdDevPoints(6)) val(stdDevPoints(7)) val(stdDevPoints(8)) val(stdDevPoints(9)) val(stdDevPoints(10))];
                fillAmount = MSE(stdDevValues, tempArr)/100;
            end

        elseif randomizer == 2
            stdDevValues = dlmread('stdDevValues.txt');
            stdDevPoints = dlmread('stdDevPoints.txt');

            val = dlmread('ExperimentVal.txt'); % This comes from the user's feedback live, read for demonstration purposes

            for j = 1 : 10
                tempArr = [val(stdDevPoints(1)) val(stdDevPoints(2)) val(stdDevPoints(3)) val(stdDevPoints(4)) val(stdDevPoints(5)) ...
                    (stdDevPoints(6)) val(stdDevPoints(7)) val(stdDevPoints(8)) val(stdDevPoints(9)) val(stdDevPoints(10))];
                fillAmount = MSE(stdDevValues, tempArr)/100;
            end
            
        else
                fillAmount = rand * 100;
        end
        
        disp(fillAmount);
        % fillAmount = rand * 100;

        white = WhiteIndex(whichScreen);
        grey = white/2;
        
        [xCenter, yCenter] = RectCenter(theRect);

        rect = [xCenter-25 yCenter-75 xCenter+25 yCenter+75];
        Screen('FillRect', theWindow, [0 fillAmount*2 0], rect + [0 150-(150 * (fillAmount/100)) 0 0]);
        Screen('FrameRect',theWindow, white, rect, 2);
        Screen('Flip', theWindow);

        waitSecs(2);
    end
    
    filePTR = fopen('start.txt', 'w');
    fprintf(filePTR, '0');
    fclose(filePTR);

    Screen(theWindow,'FillRect', 0);
    Screen(theWindow,'DrawText', 'Deney sonuclandi, katiliminiz icin tesekkurler.',50,50,255);
    Screen(theWindow,'DrawText', 'Herhangi bir tusa basarak devam edebilirsiniz...',50,100,255);
    Screen('Flip', theWindow);
    KbWait;

    dlmwrite('times2.txt', timeArray);
    
    Screen('Close', theWindow);
    fprintf(resultFile, '_________________END OF THE EXPERIMENT____________________ ');
    fclose(resultFile);
    disp(hashTable);
    return;

end

