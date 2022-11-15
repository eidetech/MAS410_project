clc; close all; clear;
g = 9.81;

% part 1
m1 = 750;
I1_x = 50;
I1_y =  50;
I1_z = 50;

%dimmensions
T = 0.1;
hl = 0.11;

%length beetween joints
L1 = .240; 
L2 = .800; 
L3 = 1.050;
L4 = 1.175;
L5 = .225;
L6 = .200;
L7 = .235;
L8 = .248;


% position of ledd
A1x = -0.4;
A1z = 0;
B1x = 0.4;
B1z = 0.24;
C1x = 0.7;
C1z = 0.24;

% part 2
m2 = 250;
I2_x = 1;
I2_y = 20;
I2_z = 20;
B2x = -1.05/2
B2z = 0;
E2x = 1.05/2;
E2z = 0;
W2 = .1;
T2 = .1;

% part 3
m3 = 150;
I3_x = 0.5;
I3_y = 8;
I3_z = 8;

% part 4
m4 = 500;
I4_x = 1;
I4_y = 10;
I4_z = 10;
D4x = 0;
D4z = 0;
B4x = 0.4;
B4z = 0;

% part 5
m5 = 50;
I5_x = 0.2;
I5_y = 1;
I5_z = 1;
Dx5 = -1.05/2;
Dz5 = 0;
Fx5 = -1.05/2;

% part 6
m5 = 150;
I6_x = 2;
I6_y = 3;
I6_z = 2;
Fx6 = -0.4/2;
Fz6 = -0.225/2;
Ex6 = 0.4/2;
Ez6 = -0.225/2;
Gx6 = 0.4/2;
Gz6 = 0.225/2;

% part 7
m7 = 200;
I7_x = 1;
I7_y = 18;
I7_z = 18;
Gx7 = -1.175/2
Gz7 = 0;
Hx7 = 1.175/2;
Hz7 = 0;

% part 8
m8 = 100;
I8_x = 0.2;
I8_y = 2;
I8_z = 2;
Hx8 = -0.2/2
Hz8 = 0;
Ix8 = 0.2/2;
Iz8 = 0;

%part 9
m9 = 50;
I9_x = 1;
I9_y = 1;
I9_z = 1;
Ix9 = -0.235/2;
Iz9 = 0;
Jx9 = 0.235/2;
Jz9 = -0.248/2;


%points to pass trough
x0 = 2;  
y0 = 0.5;
z0 = 1.6;


