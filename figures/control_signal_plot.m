clc; close all;

filename = 'control_signal';

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

plot(controlsignal{1}.Values, 'LineWidth', LW)
hold on
plot(controlsignal{2}.Values, 'LineWidth', LW)
plot(controlsignal{3}.Values, 'LineWidth', LW)

legend('$u_{ff}$', '$u_{pid}$', '$u_{sum}$', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[-]', 'interpreter', 'latex')
title('')
box on;
ylim([-1 1.2])
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all
