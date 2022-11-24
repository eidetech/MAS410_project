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
omegap = 1500;              %velosity hpu pump 
nsh = 3;
gearrationsh = nsh.*2;


rho = 875;
cd = 0.7;

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


%motor speed and required torque will change depending of number of sheaves
%pump size will also depend on motor speed
   
while t < endtime
    %movement of platform
    zp = zw *sin((2*pi/tw)*t);
    %velosity of platform 
    zpdot = (zp - zpprev)/dt;
    %acceleration of platform
    zpdotdot = (zpdot-zpdotprev)/dt; 
    
    %velosity drum
    omegad = zpdot/rd;

    %velosity motor rad/s
    omegam = omegad*6*ig;        %rad/s

    %motor shaft torque
    Mm = (m*g*dd)./(2.*nsh*2*ig) * (1+(mueq * tanh(omegam/omega0)));
    
    %flow motor
    qmotor = 1/nyv * 28.1*1e-6 * omegam/(2*pi);

    %plot
    timeplot(i) = t;
    zpplot(i) = zp;
    zpdotplot(i) = zpdot;
    zpdotdotplot(i) = zpdotdot;
    Mmplot(i) = Mm;
    qplot(i) = qmotor;
    omegamplot(i) = omegam;

    %update time
    t = t + dt;
    i = i + 1;
    
    %update zp to calculate change in movement dz/dt
    zpprev = zp;
    zpdotprev = zpdot;

end

% plot of Mm
plot(timeplot,Mmplot)
hold on
plot(timeplot,zpdotdotplot*100)
xlim([0.1,20])
%plot of flow
%plot(timeplot,qplot*1e3*60)



% %plot movement, velosity and acceleration
% fig = figure;
% plot(timeplot,zpplot, 'color',[0.6 0.8 1], 'LineWidth', 2)
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
% plot(timeplot,zpdotplot, 'color',[1 0.6 0], 'LineWidth', 2)
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
% plot(timeplot,zpdotdotplot, 'color',[0.4 0.9 0.1], 'LineWidth', 2)
% xlabel("Time [s]", 'Interpreter', 'latex')
% ylabel("$y(t)/ v(t)/a(t)$", 'Interpreter', 'latex')
% set(gca,'TickLabelInterpreter','latex')
% grid on
% legend("$y_p(t) [m]$", "$v_p(t) [m/s]$", "$a_p(t) [m/s^2]$", 'Interpreter', 'latex')
% ylim([-1,1])
% xlim([0.1,20])
% filename = "accel_platform.eps"
% saveas(fig,filename, 'epsc');


% Required motor moment
Mm = max(Mmplot);     
qmax = max(qplot);
%Displasement to generate required torque
Dm = (2*pi.*Mm)/p;                         %m^3
Dm2cm3 = Dm * 1e6;                         %cm^3

%choose displasement from Dm matrix
D_chosen = 28.1*1e-6;                     %m^3

%velosity payload m/s
zpdotmax = max(zpdotplot);                %m/s

%velosity drum rad/s
omegad = zpdotmax/rd;                    %rad/s

omegam2rpm = omegam/((2*pi)/60);          %rpm

%Required flow to reach required motor velosity with choosen motor
%dispasement 22.9 cm^3 times volumetric displacement 

Qmotor =  1/nyv * D_chosen.*omegam/(2*pi);
Qmotor2lpm = Qmotor*1e3*60;

%Determine pump displacement to provide enough flow
Dpump = (Qmotor)./omegap;                    %m^3
Dpump2cm3 = Dpump*1e6;                       %cm^3


%Calculated pl
pl = (2*pi)*Mm/D_chosen;
pl2bar = pl*1e-5;

%preassure from HPU
ps = (3/2)*pl; 
ps2bar = ps*1e-5
pr = 70e5;

%required kW
P = m * g *0.5;

qnlmax = qmax * sqrt(ps/(ps-pl));
qnlmax2lpm = qnlmax*60*1e3;

qr = 1.1*qnlmax*sqrt(pr/ps);
qrlpm = qr*60*1e3

%Kv breakvalve, choose a flow and a preassuredrop when valve fully open
%from catalogue
Qcat = 180/60000;
Pcat = 5e5
Kvmax = Qcat/sqrt(Pcat);
Admax = (Kvmax/cd)*1/(sqrt(2/875));
Admax2mm2 = Admax*1e3;


%Kv ventil
Qcatvalve = 200/60000;
Pcatvalve = 70e5;
Kvmaxvalve = Qcatvalve/sqrt(Pcatvalve);
Admaxvalve = (Kvmaxvalve/cd)*1/(sqrt(2/875));
Admaxvalve2mm2 = Admaxvalve*1e3;




