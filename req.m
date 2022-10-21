clc; clear; close all;

g = 9.81;                   %gravity
zw = 0.8;                   %wave amplitude
tw = 10;                    %total wave period
nsh = 4;                    %number of sheaves
ig = 46;                    %gear ratio gearbox
m = 9000;                   %mass of payload
mueq = 0.15;                %friction coeffisient
dd = 0.45;                  %diameter drum
nyv = 0.92;                 %volumetric effissiency
rd = dd/2;                  %radius drum
omega0 = 5;                 %velosity in friction equation 
omegap = 1500*2*pi/60;      %velosity hpu pump rad/s

%choosen pressuredrop over motor
p = 210*1e5;               


t = 0;
endtime = 20;
dt = 1e-3
i = 1;
zpprev = 0;
zpdotprev = 0;

while t < endtime

    zp = zw *sin((2*pi/tw)*t);

    zpdot = (zp - zpprev)/dt;
        
    timeplot(i) = t;
    zpplot(i) = zp;
    zpdotplot(i) = zpdot;
    
    t = t + dt;
    i = i + 1;

    zpprev = zp;
    zpdotprev = zpdot;
end

plot(timeplot,zpplot)
xlabel("Time, t")
ylabel("Position, m")

figure
plot(timeplot,zpdotplot)
xlabel("Time, t")
ylabel("Velosity, m")



%velosity payload m/s
zpdotmax = max(zpdotplot)  
%velosity drum rad/s
omegad = zpdotmax/(dd/2)
%velosity motor rad/s
omegam = omegad*ig*nsh                                  
omegam2rpm = omegam*2*pi/180*60        


% Required motor moment
Mm = (m*g*dd)/(2*nsh*2*ig) * (1+(mueq * tanh(omegad/omega0)));

%Displasement to generate required torque
Dmmin = 2*pi*Mm/p;                      %m^3
Dmmin2cm3 = Dmmin * 1e6;                %cm^3

%Required flow to reach required motor velosity with choosen motor dispasement 22cm^3

Qmmax = omegap * (23*1e-6) * nyv        %m^3/s
Qmmax2lprm = Qmmax*1e3*60               %l/min




