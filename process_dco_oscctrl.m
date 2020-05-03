clear; close all; clc;

D = readmatrix('fVCO_avg_vs_oscctrl.csv');

code = D(:,1);
freq = D(:,2)./1E9;

coarsefreq = freq(1:16:end);
coarse_lsb = diff(coarsefreq);
coarse_lsb_avg = mean(coarse_lsb);

finefreq = freq(161:161+15);
fine_lsb = diff(finefreq);
fine_lsb_avg = mean(fine_lsb);

fig_oscctrl = figure(1); clf;
p(1) = plot(code, freq, 'b', 'LineWidth', 1); hold on;
plot(code, freq, 'b.', 'MarkerSize', 10); hold on;
grid on;
hold off;
title('VCO frequency vs. coarse + fine code (TT PEX)');
xlabel('VCO oscillator code (4b coarse + 4b fine)');
ylabel('VCO Frequency (GHz)');
xlim([0 256]);
xticks(0:32:256);
ylim([2.5 7.5]);
yticks(2.5:0.5:7.5);
lsb_txt = sprintf('Coarse LSB = %0.1f MHz\nFine LSB = %0.1f MHz', coarse_lsb_avg*1E3, fine_lsb_avg*1E3);
text(129,3.5, lsb_txt, 'FontName', 'calibri', 'FontSize', 12);
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 12);

saveas(fig_oscctrl, 'fig_dco_oscctrl.png');
