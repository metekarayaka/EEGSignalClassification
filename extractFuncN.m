function [ score, type ] = extractFuncN( names, p, band, subjectTypesExpOne, subjectTypesExpTwo )

filename = char(names);

% 1 Arithmetic - 2 Moral - 3 Logical - 4 Memory
arrFirst = [1, 1, 1, 2, 2, 3];
arrSecond = [2, 3, 4, 3, 4, 4];
matrix1 = [];
matrix2 = [];
counter1 = 1;
counter2 = 1;

disp('Finding all the questions for the given combination.');

for j = 1 : 20
    first = arrFirst(p);
    second = arrSecond(p);

    % Subject 1 Experiment 1 Parameter 1

    if (subjectTypesExpOne(j) == first)
        data = dlmread(strcat(strcat(strcat(strcat(strcat('C:\Users\Mete Karayaka\Desktop\Source Code\Experiment1-Bands\', filename), int2str(j)), '-1'), char(band)),'.txt'));
        [U V] = size(data);
        meanVal = mean(data);
        data2 = zeros(1,10000-V);
        data2(data2 == 0) = meanVal;
        matrix1(counter1,:) = [data data2];
        counter1 = counter1 + 1; 
    end     

    % Subject 1 Experiment 2 Parameter 1
   if (subjectTypesExpTwo(j) == first)
        data = dlmread(strcat(strcat(strcat(strcat(strcat('C:\Users\Mete Karayaka\Desktop\Source Code\Experiment2-Bands\', filename), int2str(j)), '-2'), char(band)),'.txt'));
        [U V] = size(data);
        meanVal = mean(data);
        data2 = zeros(1,10000-V);
        data2(data2 == 0) = meanVal;
        matrix1(counter2,:) = [data data2];
        counter2 = counter2 + 1;       
   end 

    % Subject 1 Experiment 1 Parameter 2
    if (subjectTypesExpOne(j) == second)
        data = dlmread(strcat(strcat(strcat(strcat(strcat('C:\Users\Mete Karayaka\Desktop\Source Code\Experiment1-Bands\', filename), int2str(j)), '-1'), char(band)),'.txt'));
        [U V] = size(data);
        meanVal = mean(data);
        data2 = zeros(1,10000-V);
        data2(data2 == 0) = meanVal;
        matrix2(counter1,:) = [data data2];
        counter1 = counter1 + 1;          
    end     

    % Subject 1 Experiment 2 Parameter 2
   if (subjectTypesExpTwo(j) == second)
        data = dlmread(strcat(strcat(strcat(strcat(strcat('C:\Users\Mete Karayaka\Desktop\Source Code\Experiment2-Bands\', filename), int2str(j)), '-2'), char(band)),'.txt'));
        [U V] = size(data);
        meanVal = mean(data);
        data2 = zeros(1,10000-V);
        data2(data2 == 0) = meanVal;
        matrix2(counter2,:) = [data data2];
        counter2 = counter2 + 1;      
   end

end

% Operations are done here
%[W1, pc1, latent1, tsquared1] = princomp(matrix1); 
%[W2, pc2, latent2, tsquared2] = princomp(matrix2);

disp('All questions are found. Starting PCA.');

[X1, Y1] = pcaNew(matrix1,1);
hold on
[X2, Y2] = pcaNew(matrix2,2);

clear matrix1;
clear matrix2;

disp('Done with PCA. Starting KNN classification.');

sample = [ X1(1:4), X2(1:4) ; Y1(1:4), Y2(1:4) ];
sample = sample';
training = [ X1(4:8), X2(4:8) ; Y1(4:8), Y2(4:8) ];
training = training';
group = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1];
k = 2;
class = knnclassify(sample, training, group, k);
resultCor = [0, 0, 0, 0, 1, 1, 1, 1];
answerCount = 0;

disp('Finding Accuracy...');

for a = 1 : 8
    if class(a) == resultCor(a)
        answerCount = answerCount + 1;
    end
end

format bank
perc = 100*answerCount / 8;
msg = sprintf('Accuracy is found as: %f %', perc);
disp(msg);

%dlmwrite(['pcaValuesX' int2str(i) int2str(first) '.txt'], pc(1,:));
%dlmwrite(['pcaValuesY' int2str(i) int2str(first) '.txt'], pc(2,:));

%dlmwrite(['pcaValuesX' int2str(i) int2str(second) '.txt'], pc(1,:));
%dlmwrite(['pcaValuesY' int2str(i) int2str(second) '.txt'], pc(2,:));

%fileID = fopen('outPCAValues.txt', 'a');
%fprintf(fileID, '%s %d %d______\n', char(names(i)), first, second);
%fprintf(fileID, 'Latent: %f\n', max(latent1));
%fprintf(fileID, 'TSquared: %f\n', max(tsquared1));
%fprintf(fileID, 'Latent: %f\n', max(latent2));
%fprintf(fileID, 'TSquared: %f\n', max(tsquared2));

%plot(pc2(1,:),pc2(2,:),'b.'); 
%plot(pc1(1,:),pc2(2,:),'r.');
%saveas(gcf, [names(i) int2str(first) int2str(second) '.jpg']);

score = perc;
type = p;

close all;

disp('All Done for this electrode, Paused. Press anything to continue...');

end

