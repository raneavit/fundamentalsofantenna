%Pattern Multiplication phenomenon, distance between 2 elements = wavelength/2, phase difference = pi/2
clear all;
clc;
close all;
%Variables
lambda = 1;
theta = (0:0.01:2*pi);
disp("Assuming Wavelength is 1")
d1 = input("Enter the distance between the antenna in terms of wavelength lambda : ");
d = lambda*d1;
beta = input("Enter the phase difference in radians beta: ");
fprintf('\n');
k = 2*pi/lambda;
N = length(theta);
%The antenna array equation
Et_1 = abs(cos(theta));
Et_2 = [];
for i=1:N
 Et_2(i) = abs(cos(0.5*(k*d*cos(theta(i))+beta)));
end
%Total Pattern multiplication
Et = Et_1.*Et_2;
%Calculating the nulls of the plot
syms x
nulls =solve(cos(0.5*(k*d*cos(x)+beta)) == 0,x);
disp("Nulls for array factoroccur at : ");
for i=1:length(nulls)
temp = 180*nulls(i)/pi;
fprintf("%d) %.3f degrees\n",i,temp);
end
fprintf('\n');
%Calculating max
syms x
max =solve(cos(0.5*(k*d*cos(x)+beta)) == 1,x);
disp("Maximas for array factor occur at : ");
for i=1:length(max)
temp = 180*max(i)/pi;
fprintf("%d) %.3f degrees\n",i,temp);
end
%Plotting the graph
subplot(131);
polarplot(theta, Et_1, 'r','LineWidth',2);
title('Polar Plot(Radiation Pattern)','FontSize',15);
set(gca,'FontSize',15);
subplot(132);
polarplot(theta, Et_2, 'g','LineWidth', 2);
title('Polar Plot(ArrayFactor)','FontSize',15);
set(gca,'FontSize',15);
subplot(133);
polarplot(theta, Et, 'b','LineWidth', 2);
title('Polar Plot(Combined Plot)','FontSize',15);
set(gca,'FontSize',15);
thetaticks(0:30:360);
