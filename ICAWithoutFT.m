clear;

% read the data and transpose
M = dlmread('C:\Users\Mete Karayaka\Desktop\Data\out1.txt', ',');	% s6_data_postawk.txt
M = M.';
signal_count = size(M, 1);
column_count = size(M, 2);

% plot the original EEG
% plot_signal(M, 'Original Signal #');


% detrend (Mete)
M_detrend = zeros(signal_count, column_count);
for i = 1:signal_count
	M_detrend(i, :) = detrend(M(i, :));
end

% plot detrended signals
% plot_signal(M_detrend, 'Detrended Signal');

% create bandpass filter object(Mete)
d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2', 0.00001 , 2/50, 28/50 , 0.99999);
Hd = design(d, 'equiripple');


% apply the filter
M_bandpassed = zeros(signal_count, column_count);
for i = 1:signal_count
	M_bandpassed(i, :) = filter(Hd, M_detrend(i, :));
end

% plot bandpass filtered signals
% plot_signal(M_bandpassed, 'Bandpassed Signal');

% ica
[IC, A, W] = fastica(M_bandpassed);

% plot the results
% plot_signal(IC, 'Independent Component #');

% asking for artifact no
EXCLUDED_ROWS = [1, 2, 3, 4, 5, 6, 7, 8, 9];

% remove IC1
IC_NOARTIFACT = IC;

for i = 1:signal_count
    if(ismember(i, EXCLUDED_ROWS))
        IC_NOARTIFACT(i, :) = zeros(1, size(IC, 2));
    end
end

IC_NOARTIFACT = inv(W) * IC_NOARTIFACT;

plot_signal(IC_NOARTIFACT, 'PostICA Signal #');

dlmwrite('filteredWholeData1.txt', IC_NOARTIFACT); 

