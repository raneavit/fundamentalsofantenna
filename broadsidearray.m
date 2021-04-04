%Fundamentals of Antenna Lab
% 6 element Broadside array
clc;
clear all;
close all;
%Variables
lambda = 1;
N = 6;
theta = linspace(0,2*pi,1000);
disp("Assuming lambda is 1");
d = input("Enter the spacing between the antennas in terms of wavelength lambda ");
disp("For broadside antenna, phase difference between the elements beta =0")
beta = 0;
fprintf('\n');
k = 2*pi/lambda;
theta_broadside = 90; %For broadside direction, theta is 90 degrees
%Progressive phase excitation
ppc = k*d*cosd(theta_broadside)+ beta;
%calculating the normalized array factor
af = cos(1.5*(k*d*cos(theta) + beta)).*(2*cos(k*d*cos(theta)+beta) + 1);
af = af/3;
%Calculating the nulls
syms x
nulls = solve(cos(1.5*(k*d*cos(x) + beta)).*(2*cos(k*d*cos(x)+beta)+ 1)== 0,x);
disp("The nulls are : ");
%Checking if nulls exist
flag = 0;
if isreal(nulls)
flag = 1;
end
if flag==0
disp("Nulls do not exist");
else
for i=1:length(nulls)
temp = 180*nulls(i)/pi;
fprintf("%d) %.3f Degrees\n",i,temp);
end
end
fprintf('\n');
%Caclulating the maximas
maximas = find(af == max(af));
disp("The maximas are : ");
for i=1:length(maximas)
temp = theta(maximas(i))*180/pi;
fprintf("%d) %.3f Degrees\n",i,temp);
end
fprintf('\n');
%Calculating Half Power Beam Width
hpbw = 180*2*(pi/2 - acos((1.391*lambda)/(pi*N*d)))/pi;
fprintf("Half Power Beam Width: %.3f Degrees\n", hpbw);
%Calculating directivity
D = 2*N*d/lambda;
fprintf("Directivity : %.3f \n", D);
D = 10*log10(D);
fprintf("in dB : %.3f dB \n", D);
%Plotting the graph
polarplot(theta,af,'LineWidth',2);
title('Polar Plot(Array Factor : Normalized)','FontSize',15);
set(gca,'FontSize',15);