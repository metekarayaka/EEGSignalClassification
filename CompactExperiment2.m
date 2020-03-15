function  CompactExperiment2( )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

    totalQuestions = 20;  % Change when the number of questions are changed, randomizer values also will be needed to change %
    hashTable = zeros(1, totalQuestions);
    timeArray = [];
    resultFile = fopen('results2.txt', 'a');
    typesFile = fopen('types2.txt', 'a');

    questionArr = {'Bir onceki deneyde cevapladiginiz ilk soru neydi?'
                   'En son okudugunuz kitabin ismi neydi?'
                   'Sizi en etkileyen aniniz neydi?'
                   'En son tatil yaptiginiz yer neresiydi?'
                   'En son uzerinde calistiginiz konu neydi?'
                   'Bir sirkettesiniz. Grup olarak bir proje yaptiniz ve bu proje odul aldi fakat odulu sadece siz biliyorsunuz. Odul parasini kendinize saklayabilir veya paylasabilirsiniz. Ne yapardiniz?'
                   'Bir sirkettesiniz. Sirketten biri cikarilacak. Ya siz cikarilacaksiniz ya da yakin bir arkadasinizi siz cikartacaksiniz. Ne yapardiniz?'
                   'Tanidiginiz bir kisiyi veya tanimadiginiz bin kisi olumden kurtarabilecek olsaniz, kimi(leri) kurtarirdiniz?'
                   '105 yasina kadar yasamak ile 70 yasinda olmek arasindan hangisini secerdiniz?'
                   'Her konuyu az cok bilmekle bir konuyu tamamen bilmek arasindan hangisini secerdiniz?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   '98/7 isleminin sonucu nedir?'
                   '73x3 isleminin sonucu nedir?'
                   '143/13 isleminin sonucu nedir?'
                   '108/9 isleminin sonucu nedir?'
                   '56*4 isleminin sonucu nedir?'
    };
   
    answerArrA = { 'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'A) Odulu alirim.'
                   'A) Isten cikarim.'
                   'A) Tanidigim bir kisiyi kurtaririm.'
                   'A) 105 yasina kadar yasamak.'
                   'A) Her konuyu az cok bilmek.'
                   'A) A C M I E' % A C E M I
                   'A) A K R P E' % A K R E P
                   'A) N A R F A' 
                   'A) A C K E L'
                   'A) P A E K F'
                   'A) 16'
                   'A) 229'
                   'A) 11'
                   'A) 12'
                   'A) 254'
    };

    answerArrB = { ''
                   ''
                   ''
                   ''
                   ''
                   'B) Odulu paylasirim.'
                   'B) Yakin arkadasimi cikaririm.'
                   'B) Tanimadigim kisileri kurtaririm.'
                   'B) 70 yasinda olmek.'
                   'B) Bir konuyu cok iyi bilmek.'
                   'B) M A Z B E'
                   'B) E R Z I K'
                   'B) M G E K E'
                   'B) B A O N L' % B A L O N
                   'B) I C L A Y'
                   'B) 15'
                   'B) 219'
                   'B) 12'
                   'B) 13'
                   'B) 244'
    };
    
    answerArrC = { ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   'C) N F A F M'
                   'C) N I K A A'
                   'C) A G M A D' % D A M G A
                   'C) I A S N S'
                   'C) E Z K A L'
                   'C) 14'
                   'C) 209'
                   'C) 13'
                   'C) 14'
                   'C) 234'   
    };

    answerArrD = { ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   ''
                   'D) L A R N A'
                   'D) L G A K A'
                   'D) E A Z B N'
                   'D) Z E E T U'
                   'D) E N A Z K' % E N K A Z
                   'D) 13'
                   'D) 199'
                   'D) 14'
                   'D) 15'
                   'D) 224'

    };

	Screen('Preference', 'SkipSyncTests', 1);    
    whichScreen = max(Screen('Screens'));
    [theWindow, theRect] = Screen('OpenWindow', whichScreen);

    Screen(theWindow,'FillRect', 0.5);
    Screen(theWindow,'DrawText', 'Deneye hosgeldiniz.',50,50,255);
    Screen(theWindow,'DrawText', 'Size, cevaplamaniz icin 20 tane soru verilecektir.',50,100,255);       
    Screen(theWindow,'DrawText', 'Cevabinizi klavyeden a,b,c veya d tuslarina basarak verebilirsiniz.',50,150,255);
    Screen(theWindow,'DrawText', 'Bazi sorularda secenekler bulunmuyor, bu sorulari cevapladiktan sonra ',50,200,255);
    Screen(theWindow,'DrawText', 'a,b,c veya dye basarak gecebilirsiniz.',50,250,255);
    Screen(theWindow,'DrawText', 'Herhangi bir tusa basarak devam edebilirsiniz...',50,300,255);
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

        if randomizer == 6

            Screen(theWindow,'DrawText', 'Bir sirkettesiniz. Grup olarak bir proje yaptiniz ve bu proje odul aldi fakat odulu sadece', 50,50,255);
            Screen(theWindow,'DrawText', 'siz biliyorsunuz. Odul parasini kendinize saklayabilir veya paylasabilirsiniz. Ne yapardiniz?', 50,100,255);
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,150,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,350,255);
            Screen('Flip', theWindow);  

            fprintf(typesFile, '2,');
            
            waitSecs(1);
        end
        
        if randomizer == 7

            Screen(theWindow,'DrawText', 'Bir sirkettesiniz. Sirketten biri cikarilacak. Ya siz cikarilacaksiniz ya da yakin bir  ', 50,50,255);
            Screen(theWindow,'DrawText', 'arkadasinizi Bir sirkettesiniz. Sirketten biri cikarilacak. Ya siz cikarilacaksiniz', 50,100,255);
            Screen(theWindow,'DrawText', 'ya da yakin bir arkadasinizi siz cikartacaksiniz. Ne yapardiniz?', 50,150,255);
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,350,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,400,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '2,');

            waitSecs(1);
        end

        if randomizer == 8

            Screen(theWindow,'DrawText', 'Tanidiginiz bir kisiyi veya tanimadiginiz bin kisi olumden kurtarabilecek ', 50,50,255);
            Screen(theWindow,'DrawText', 'olsaniz, kimi(leri) kurtarirdiniz?' , 50,100,255);
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,150,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,350,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '2,');

            waitSecs(1);
        end

        if randomizer == 9
            Screen(theWindow,'DrawText', '105 yasina kadar yasamak ile 70 yasinda olmek arasindan hangisini secerdiniz?  ', 50,50,255);
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,100,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,150,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,300,255);
            Screen('Flip', theWindow); 

            fprintf(typesFile, '2,');

            waitSecs(1);
        end

        if randomizer == 10
            Screen(theWindow,'DrawText', 'Bir ogretmensiniz. Mezun olmaya aday iyi ve caliskan bir ogrenciniz hastalaniyor ve yapmasi ', 50,50,255);
            Screen(theWindow,'DrawText', 'gereken son odevini baska bir ogrenciden aliyor. Siz de bunun farkina variyorsunuz, bu ' , 50,100,255);
            Screen(theWindow,'DrawText', 'durumu rapor ederseniz ogrenciniz zor durumda kalip gec mezun olacak. Ne yapardiniz?', 50,150,255)
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,350,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,400,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '2,');

            waitSecs(1);
        end


        if randomizer > 10

            Screen(theWindow,'DrawText', char(strcat('', questionArr(randomizer))), 50,50,255);
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,100,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,150,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,300,255);
            Screen('Flip', theWindow);

            if randomizer > 15
                fprintf(typesFile, '1,');
            else
                fprintf(typesFile, '3,');
            end
            
            waitSecs(1);
        end
        if randomizer < 5
            Screen(theWindow,'DrawText', char(strcat('', questionArr(randomizer))), 50,50,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '4,');

            waitSecs(1);
        end

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

