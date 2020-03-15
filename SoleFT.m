matrixNames = {'O1', 'O2', 'P7', 'P8', 'AF3', 'F7', 'F3', 'FC5', 'T7', 'T8', 'FC6', 'F4', 'F8', 'AF4'};

for questionN = 1:20 
    M = [];
    for i = 1:14
            data = dlmread(strcat(strcat(strcat(strcat('C:\Users\Mete Karayaka\Desktop\Source Code\Experiment1\', char(matrixNames(i))), int2str(questionN)), '-1'),'.txt'));
            data = data.';
            M(i,:) = data;
    end
    M_DOWNSAMPLED = M;

    Fs = 100;     % sampling frequency
    T = 1/Fs;     % sampling period
    L = size(M_DOWNSAMPLED, 2); % length of signal
    t = (0:L-1)*T;    % time vector

    frequency_axis = linspace(0, Fs/2, L/2);

    ffts = [];
    mags = [];
    phases = [];

    sum_signals = [];
    band_array = ['t', 'd', 'a', 'b', 'g'];

    for counter = 1:5
        for i = 1:14
            ffts = [ffts; fft(M_DOWNSAMPLED(i, :))];

            mag  = abs(ffts(i, :))/(Fs/2);
            mags = [mags; mag(1:L/2)];

            [pks, locs] = findpeaks(mags(i, :)); % peaks
    %             figure;
    %             plot(frequency_axis, mags(i, :), frequency_axis(locs), pks, 'xr');
    %             grid on;
    %             title('magnitude');

            phase = angle(ffts(i, :));
            phases = [phases; phase(1:L/2)];

            % tetha: 0.5 - 4
            % delta: 4 - 8
            % alpha: 8 - 13
            % beta: 13 - 32
            % gamma: 32 - 100

            initMatrix = [0.5, 4, 8, 13, 32];
            limitMatrix = [4, 8, 13, 32, 100];

            % sum the delta signals
            start_i = round(initMatrix(counter)/(Fs/L));
            stop_i = round(limitMatrix(counter)/(Fs/L));

            sum = zeros(1, L);
            peak_count = size(pks, 2);
            
            for j = 1:peak_count
                if(locs(j) > stop_i)
                    break;
                end
                if(locs(j) < start_i)
                    continue;
                end

                a = pks(j);
                f = frequency_axis(j);
                p = phases(i, locs(j));

                signal_i = a*cos(2*pi*f*t + p);
                sum = sum + signal_i;
            end

            sum_signals = [sum_signals; sum];
        end

    %         for j = 1:14
    %             figure;
    %             plot(sum_signals(j, :));
    %         end

        for k = 1:14
            filename = strcat(strcat(strcat(strcat(char(matrixNames(k))), int2str(questionN)), '-1'), char(band_array(counter)),'.txt');
            disp(filename);
            dlmwrite(filename, sum_signals(k,:));
        end

        sum_signals = [];

        disp('Done with this type of frequency band. Press to continue with the others...');
    %         pause;
    end
end