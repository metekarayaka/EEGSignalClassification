function  CompactExperiment( )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here

    totalQuestions = 20;  % Change when the number of questions are changed, randomizer values also will be needed to change %
    hashTable = zeros(1, totalQuestions);
    timeArray = [];
    resultFile = fopen('results1.txt', 'a');
    typesFile = fopen('types1.txt', 'a');

    questionArr = {'Dun aksam yemeginde ne yediginiz?'
                   'Telefonda en son kiminle gorustunuz?'
                   'Sizi en etkileyen ruyaniz neydi?'
                   'En son izlediginiz film nedir?'
                   'En yakin arkadasinizla en son ne konu hakkinda konustunuz?'
                   'Bir bankadasiniz. Bir adam bankayi soyuyor ve paralari yetimhaneye ve yoksullara bagislayacagini soyluyor. Ne yaparsiniz?'
                   'Organ nakli bekleyen, olmek uzere olan bes hastanin doktorusunuz. Tum cabalara ragmen aranan organlar bulunamadi. olmek uzere olan altinci bir hastaniz daha var. olurse tum organlari diger bes hastayi olmekten kurtaracak. Elinde de altinci hastayi tamamen iyilestirecek bir ilac var. Ne yaparsiniz?'
                   'Bir sirkette mudursunuz. Ýse eleman alinacak. 2 kisi basvuruyor. Biri uzun suredir issiz, is tecrubesi az, alaninda yetersiz ama ise ihtiyaci bir arkadasiniz olan digeri ise tecrubeli, profesyonel, tanimadiginiz biri. Ne yaparsiniz?'
                   'Bir cetenin uyesisiniz. cetenin baska bir uyesiyle bir suc islediniz ve yakalandiniz. Iki ayri sorgu odasinda birbirinizden bagimzsiz sorgulaniyorsunuz. Ceza indirimi alip sucunuzu itiraf edebilirsiniz veya sessiz kalarak kurtulmayi deneyebilirsiz ama bu durumda cetenin diger uyesi sucu uzerinize atabilir. Ne yaparsiniz?'
                   'Bir ogretmensiniz. Mezun olmaya aday iyi ve caliskan bir ogrenciniz hastalaniyor ve yapmasi gereken son odevini baska bir ogrenciden aliyor. Siz de bunun farkina variyorsunuz, bu durumu rapor ederseniz ogrenciniz sikinti yasayip gec mezun olacak. Ne yapardiniz?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   'Asagidakilerden hangisi bes harfli bir Turkce kelime olusturabilir?'
                   '102/3 isleminin sonucu nedir?'
                   '67x3 isleminin sonucu nedir?'
                   '132/11 isleminin sonucu nedir?'
                   '98/7 isleminin sonucu nedir?'
                   '76*4 isleminin sonucu nedir?'
    };
   
    answerArrA = { 'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'Hatirlamaya calismaniz yeterli.'
                   'A) Polisi ararim.'
                   'A) Altinci hastanin olmesini bekler, organlari ile bes hastayi kurtaririm.'
                   'A) Yakin arkadasimi ise alirim.'
                   'A) Sucu itiraf ederim.'
                   'A) Gormezden gelirim.'
                   'A) F M A L A' % F L A M A
                   'A) M K A A M' % M A K A M
                   'A) N A K F A' 
                   'A) E L K A S'
                   'A) P A A K Z'
                   'A) 36'
                   'A) 171'
                   'A) 11'
                   'A) 16'
                   'A) 316'
    };

    answerArrB = { ''
                   ''
                   ''
                   ''
                   ''
                   'B) Polisi aramam.'
                   'B) Altinci hastaya ilaci verir, olmekten kurtaririm.'
                   'B) Tanimadigim kisiyi ise alirim.'
                   'B) Sessiz kalirim.'
                   'B) Rapor ederim.'
                   'B) M A F A R'
                   'B) M R A M A'
                   'B) B Z E K A'
                   'B) O A S I L' % O L A S I
                   'B) E C L A Y'
                   'B) 34'
                   'B) 181'
                   'B) 12'
                   'B) 15'
                   'B) 314'
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
                   'C) N A A F M'
                   'C) N N K A A'
                   'C) N B I A Z' % N A B I Z
                   'C) E A S N S'
                   'C) E B K A L'
                   'C) 32'
                   'C) 191'
                   'C) 13'
                   'C) 14'
                   'C) 306'   
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
                   'D) M A F N A'
                   'D) R H A K A'
                   'D) E I Z B N'
                   'D) Z S E T U'
                   'D) K B B U E' % K U B B E
                   'D) 28'
                   'D) 201'
                   'D) 14'
                   'D) 13'
                   'D) 304'

    };

	Screen('Preference', 'SkipSyncTests', 1);    
    whichScreen = max(Screen('Screens'));
    [theWindow, theRect] = Screen('OpenWindow', whichScreen);

    Screen(theWindow,'FillRect', 0.5);
    Screen(theWindow,'DrawText', 'Deneye hosgeldiniz.',50,50,255);
    Screen(theWindow,'DrawText', 'Size, cevaplamaniz icin 20 tane soru verilecektir.',50,100,255);       
    Screen(theWindow,'DrawText', 'Cevabinizi klavyeden a,b,c veya d tuslarina basarak verebilirsiniz.',50,150,255);
    Screen(theWindow,'DrawText', 'Herhangi bir tusa basarak devam edebilirsiniz...',50,200,255);
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

            Screen(theWindow,'DrawText', 'Bir bankadasiniz. Bir adam bankayi soyuyor ve paralari ', 50,50,255);
            Screen(theWindow,'DrawText', 'yetimhaneye ve yoksullara bagislayacagini soyluyor. Ne yaparsiniz?', 50,100,255);
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

            Screen(theWindow,'DrawText', 'Organ nakli bekleyen, olmek uzere olan bes hastanin doktorusunuz. Tum cabalara ragmen ', 50,50,255);
            Screen(theWindow,'DrawText', 'aranan organlar bulunamadi. Olmek uzere olan altinci bir hastaniz daha var. Olurse tum ', 50,100,255);
            Screen(theWindow,'DrawText', 'organlari diger bes hastayi olmekten kurtaracak. Elinde de altinci hastayi ', 50,150,255);
            Screen(theWindow,'DrawText', 'tamamen iyilestirecek bir ilac var. Ne yaparsiniz?', 50,200,255)
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,350,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,400,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,450,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '2,');

            waitSecs(1);
        end

        if randomizer == 8

            Screen(theWindow,'DrawText', 'Bir sirkette mudursunuz. Ise eleman alinacak. 2 kisi basvuruyor. Biri uzun suredir issiz, ', 50,50,255);
            Screen(theWindow,'DrawText', 'is tecrubesi az, alaninda yetersiz ama ise ihtiyaci olan bir arkadasiniz digeri ise' , 50,100,255);
            Screen(theWindow,'DrawText', 'tecrubeli, profesyonel, tanimadiginiz biri. Ne yaparsiniz?', 50,150,255)
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,200,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,350,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,400,255);
            Screen('Flip', theWindow);

            fprintf(typesFile, '2,');

            waitSecs(1);
        end

        if randomizer == 9
            Screen(theWindow,'DrawText', 'Bir cetenin uyesisiniz. Cetenin baska bir uyesiyle bir suc islediniz ve yakalandiniz. Iki ayri  ', 50,50,255);
            Screen(theWindow,'DrawText', 'sorgu odasinda birbirinizden bagimsiz sorgulaniyorsunuz. Ceza indirimi alip sucunuzu itiraf ', 50,100,255);
            Screen(theWindow,'DrawText', 'edebilirsiniz veya sessiz kalarak kurtulmayi deneyebilirsiz ama bu durumda cetenin diger', 50,150,255);
            Screen(theWindow,'DrawText', 'uyesi sucu uzerinize atabilir. Ne yaparsiniz?', 50,200,255)
            Screen(theWindow,'DrawText', 'Lutfen cevabinizi seciniz; ',50,250,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrA(randomizer))), 50,300,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrB(randomizer))), 50,350,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrC(randomizer))), 50,400,255);
            Screen(theWindow,'DrawText', char(strcat('', answerArrD(randomizer))), 50,450,255);
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
    
    filePTR = fopen('start1.txt', 'w');
    fprintf(filePTR, '0');
    fclose(filePTR);

    Screen(theWindow,'FillRect', 0);
    Screen(theWindow,'DrawText', 'Deney sonuclandi, katiliminiz icin tesekkurler.',50,50,255);
    Screen(theWindow,'DrawText', 'Herhangi bir tusa basarak devam edebilirsiniz...',50,100,255);
    Screen('Flip', theWindow);
    KbWait;

    dlmwrite('times.txt', timeArray);
    
    Screen('Close', theWindow);
    fprintf(resultFile, '_________________END OF THE EXPERIMENT____________________ ');
    fclose(resultFile);
    disp(hashTable);
    return;                     
end

