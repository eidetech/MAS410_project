clc; clear; close all;

g = 9.81;                   %gravity
zw = 0.8;                   %wave amplitude
tw = 10;                    %total wave period
ig = 46;                    %gear ratio gearbox
m = 9000;                   %mass of payload
mueq = 0.15;                %friction coeffisient
dd = 0.45;                  %diameter drum
nyv = 0.92;                 %volumetric effissiency
rd = dd/2;                  %radius drum
omega0 = 5;                 %velosity in friction equation 
omegap = 1500*(2*pi)/60;    %velosity hpu pump rad/s

%choosen pressuredrop over motor
p = 210*1e5;               

%time and index
t = 0;
endtime = 20;
dt = 1e-4;
i = 1;

%init derrivative
zpprev = 0;
zpdotprev = 0;

while t < endtime
    %movement of platform
    zp = zw *sin((2*pi/tw)*t);
    %velosity of platform 
    zpdot = (zp - zpprev)/dt;
    %acceleration of platform
    zpdotdot = (zpdot-zpdotprev)/dt; 

    % Required motor moment
    Mm = (m*g*dd)./(2.*2*2*ig) * (1+(mueq * tanh((zpdot/rd)/omega0)));

    %plot
    timeplot(i) = t;
    zpplot(i) = zp;
    zpdotplot(i) = zpdot;
    zpdotdotplot(i) = zpdotdot;
    Mmplot(i) = Mm;

    %update time
    t = t + dt;
    i = i + 1;
    
    %update zp to calculate change in movement dz/dt
    zpprev = zp;
    zpdotprev = zpdot;

end

%plot of Mm
%plot(timeplot,Mmplot)

% %plot movement, velosity and acceleration
% %fig = figure;
% %plot(timeplot,zpplot, 'color',[0.3 0.7 0.9], 'LineWidth', 2)
% filename = "platform_plot.eps"
% xlabel("Time [s]", 'Interpreter', 'latex')
% ylabel("$z_p$ [m]", 'Interpreter', 'latex')
% set(gca,'TickLabelInterpreter','latex')
% grid on
% ylim([-1,1])
% %saveas(fig,filename, 'epsc')
% hold on
% 
% %fig2 = figure;
% %plot(timeplot,zpdotplot, 'color',[0.6 0.1 0.2], 'LineWidth', 2)
% %xlabel("Time [s]", 'Interpreter', 'latex')
% ylabel("$v_p(t)$ [m/s]", 'Interpreter', 'latex')
% set(gca,'TickLabelInterpreter','latex')
% grid on
% ylim([-1,1])
% xlim([0.1,20])
% %filename = "vel_platform.eps"
% %saveas(fig2,filename, 'epsc')
% 
% %fig3 = figure;
% %plot(timeplot,zpdotdotplot, 'color',[0.4 0.8 0.4], 'LineWidth', 2)
% xlabel("Time [s]", 'Interpreter', 'latex')
% ylabel("$y(t)/ v(t)/a(t)$", 'Interpreter', 'latex')
% set(gca,'TickLabelInterpreter','latex')
% grid on
% legend("$y_p(t) [m]$", "$v_p(t) [m/s]$", "$a_p(t) [m/s^2]$", 'Interpreter', 'latex')
% ylim([-1,1])
% xlim([0.1,20])
% %filename = "accel_platform.eps"
% %saveas(fig,filename, 'epsc');


%motor speed and required torque will change depending of number of sheaves
%pump size will also depend on motor speed
nsh = [2 3 4 5];            %matrix with number of sheaves

%velosity payload m/s
zpdotmax = max(zpdotplot);                %m/s  
%velosity drum rad/s
omegad = zpdotmax/rd;                 %rad/s
      

% Required motor moment

Mm = (m*g*dd)./(2.*nsh*2*ig) * (1+(mueq * tanh(omegad/omega0)));

%Displasement to generate required torque
Dm = (2*pi.*Mm)/p;                      %m^3
Dm2cm3 = Dm * 1e6;                      %cm^3

%choose displasement from Dm matrix
D_chosen = [45.6*1e-6 22.9*1e-6 12*1e-6 10.3*1e-6];           %m^3

%velosity motor rad/s
omegam = omegad.*nsh*ig;
omegam2rpm = omegam./((2*pi)/60);          %rpm

%Required flow to reach required motor velosity with choosen motor
%dispasement 22.9 cm^3 times volumetric displacement 

Qmotor = D_chosen.*omegam;
Qmotor2lpm = ((Qmotor.*nyv)*1e3)*60
%Determine pump displacement to provide enough flow 

Dpump = (Qmotor)./omegap;                   %m^3
Dpump2cm3 = Dpump*1e6                       % cm




