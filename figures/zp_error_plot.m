clc; close all;

filename = 'zp_error_plot';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
hold on

plot(z_error_w_ff{1}.Values, 'Color', '#ff6929', 'LineWidth', LW)
hold on
plot(z_error_wo_ff{1}.Values, 'Color', '#7e2f8e', 'LineWidth', LW)

legend('$zp_{error}$ with ff', '$zp_{error}$ without ff', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[m]', 'interpreter', 'latex')
title('')
box on;
ylim([-0.04 0.08])
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all