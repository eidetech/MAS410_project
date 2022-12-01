clc; close all;

filename = 'nl_flow_plot';

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
t = 0;
dt = 1;
tr=1;
for i = 1:120
   NL_flow{2}.Values.Data(i) = 38.3;
   t=t+dt;
end


plot(NL_flow{2}.Values, 'Color', '#0072bd', 'LineWidth', LW)

legend('No load flow', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[L/min]', 'interpreter', 'latex')
title('')
box on;
xlim([0 0.4])
ylim([0 470])

set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all