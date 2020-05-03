clear; close all; clc;

D = readmatrix('fVCO_avg_vs_droopctrl.csv');

code = D(:,1);
freq = D(:,2)./1E9;

droop_lsb = diff(freq);
droop_lsb_avg = mean(droop_lsb);

fig_oscctrl = figure(1); clf;
p(1) = plot(code, freq, 'b', 'LineWidth', 2); hold on;
plot(code, freq, 'b.', 'MarkerSize', 20); hold on;
grid on;
hold off;
title('VCO frequency vs. droop code (TT PEX, coarse + fine = 112)');
xlabel('VCO droop code (3b)');
ylabel('VCO Frequency (GHz)');
xlim([0 7]);
ylim([4.8 5.25]);
yticks(4.8:0.05:5.25);
lsb_txt = sprintf('Droop LSB = %0.1f MHz', droop_lsb_avg*1E3);
text(4.1,4.92, lsb_txt, 'FontName', 'calibri', 'FontSize', 12);
set(gca, 'FontName', 'calibri');
set(gca, 'FontSize', 12);

saveas(fig_oscctrl, 'fig_dco_droopctrl.png');
