clear; close all; clc;

D = readmatrix('dco_response.csv');

timer = D(:,1);
freqr = D(:,2);
timef = D(:,3);
freqf = D(:,4);

submatrix = [timer' timef'; freqr' freqf'];
submatrix = submatrix';

submatrix = sortrows(submatrix);

time = submatrix(:,1)./1E-9;
freq = submatrix(:,2)./1E9;

idxhi_last  = find(freq > 5.68, 1, 'last');
idxlo_first = find(freq < 5.24, 1, 'first');

timehi_last     = time(idxhi_last);
timelo_first    = time(idxlo_first);

close all;
fig_dcoresponse = figure('Position', [100 100 400 300]); clf;
p(1) = plot(time, freq, 'b', 'LineWidth', 2); hold on;
plot([timehi_last timehi_last], [-10 10], 'k--', 'LineWidth', 2); hold on;
plot([timelo_first timelo_first], [-10 10], 'k--', 'LineWidth', 2); hold on;
plot(time, freq, 'b.', 'MarkerSize', 20); hold on;
%annotation('textarrow', [timehi_last/5.5 timelo_first/5.5], [5.5/5.7 5.5/5.7]);
annotation('doublearrow', [2.4/5.5 3.4/5.5], [3.5/5.7 3.5/5.7]);
txtstr = sprintf('T_{ACT,DCO}=%0.0f ps', 1e3*(timelo_first - timehi_last));
text(5.15,5.5, txtstr, 'FontName', 'calibri', 'FontSize', 12);
grid on;
hold off;
title('DCO freq. vs time for full-scale droop change');
xlabel('Time (ns)');
ylabel('DCO Frequency (GHz)');
xlim([4.5 5.5]);
xticks(4.5:0.1:5.5);
ylim([5.2 5.7]);
yticks(5.2:0.1:5.7);
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 12);

saveas(fig_dcoresponse, 'fig_dco_response.png');
