clc; close all;

filename = 'pressure_drop_motor';

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

% '-o', 'MarkerIndices', 1:500:length(flow{1}.Values.Data),
plot(pressure{1}.Values, 'LineWidth', LW)
hold on
plot([4 12],[138 138], '--r', 'LineWidth', LW)
plot([4 12],[186 186], '--k', 'LineWidth', LW)
legend('Pressure drop motor', 'Lowering, 138 [bar]', 'Hoisting, 186 [bar]', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[bar]', 'interpreter', 'latex')
title('')
box on;
xlim([4 12])
ylim([120 260])
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all