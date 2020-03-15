% Data of Subject 1 %
data1 = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\filteredWholeData1.txt', ',');
data1 = data1.';
data2 = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\filteredWholeData2.txt', ',');
data2 = data2.';

times1 = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\times1.txt', ',');
times2 = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\times2.txt', ',');

disp('Read the data!');

% Data 1 %
lenght = size(data1);
lenght1 = lenght(1);

totalTime1 = times1(20);

dataPerTime1 = round(lenght1/totalTime1);

% Data 2 %
lenght = size(data2);
lenght2 = lenght(1);

totalTime2 = times2(20);

dataPerTime2 = round(lenght2/totalTime2);

% Seperate and Write % 
matrixNames = {'O1', 'O2', 'P7', 'P8', 'AF3', 'F7', 'F3', 'FC5', 'T7', 'T8', 'FC6', 'F4', 'F8', 'AF4'};
oldTimeStamp = 1;

for i = 1: 14
    for j = 1: 20
        timeStamp = round(times1(j) * dataPerTime1);
        if timeStamp > lenght1
            timeStamp = lenght1;
        end
        dataTemp = data1(oldTimeStamp:timeStamp, i);
        filename = strcat(char(matrixNames(i)), int2str(j));  
        dlmwrite(strcat(filename, '-1.txt'), dataTemp);
        oldTimeStamp = timeStamp;
    end
    oldTimeStamp = 1;
    % pause;
end

disp('Done Seperating the first Experiment, Press anything to continue with the second Experiment.');
pause;
oldTimeStamp = 1;

for i = 1: 14
    for j = 1: 20
        timeStamp = round(times2(j) * dataPerTime2);
        if timeStamp > lenght2
            timeStamp = lenght2;
        end
        dataTemp = data2(oldTimeStamp:timeStamp, i);
        filename = strcat(char(matrixNames(i)), int2str(j));  
        dlmwrite(strcat(filename, '-2.txt'), dataTemp);
        oldTimeStamp = timeStamp;
    end
    oldTimeStamp = 1;
    % pause;
end

disp('Completed!');