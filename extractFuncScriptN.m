subjectTypesExpOne = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\types1.txt', ',');
subjectTypesExpTwo = dlmread('C:\Users\Mete Karayaka\Desktop\Source Code\Deneme\types2.txt', ',');

names = {'O1', 'O2', 'P7', 'P8', 'AF3', 'F7', 'F3', 'FC5', 'T7', 'T8', 'FC6', 'F4', 'F8', 'AF4'};
bands = {'t', 'd', 'a', 'b', 'g'};

prevScore = 0;
prevType = 0;
prevBand = '';

ans_score = zeros(1, 14);
ans_band = zeros(1, 14);
ans_type = zeros(1, 14);

total_arr = zeros(14,6,5);

for q = 1 : 14
    for p = 1 : 6
        for r = 1 : 5
            msg = sprintf('Currently processing %s electrode and %d combination out of 14 electrodes and 6 combinations \n for the band %s.', char(names(q)), p, char(bands(r)));
            disp(msg);
            [ score, type ] = extractFuncN( names(q), p, bands(r), subjectTypesExpOne, subjectTypesExpTwo );
            total_arr(q,p,r) = score;
            if score > prevScore
                prevScore = score;
                prevType = type;
                prevBand = bands(r);
                electrode = names(q);
            end
        end
    end
    ans_score(q) = prevScore;
    ans_band(q) = char(prevBand);
    ans_type(q) = prevType;
    prevScore = 0;
    prevType = 0;
    prevBand = '';
end

ans_band = char(ans_band);