clc; close all;

filename = 'flow_motor_leakage_plot';

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

plot(flow_motor{1}.Values, 'Color', '#0072bd', 'LineWidth', LW)
hold on
plot(flow_motor{2}.Values, 'Color', '#7e2f8e', 'LineWidth', LW)

legend('Motor flow', 'Motor + leakage flow', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[L/min]', 'interpreter', 'latex')
title('')
box on;
xlim([8.5 11.5])
ylim([130 205])
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all