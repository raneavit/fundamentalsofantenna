% Endfire array distance between elements is wavelength/2
% No. of elements n = 6
clear all;
clc;
close all;
disp("Assuming lambda is 1");
lambda = 1;
d= lambda/4;
disp("Number of elements in array is 6, placed symmetrically about positive and negative z axis");
theta = [0:0.01:2*pi];
af=(sin((3*pi/2)*cos(theta))).*(2*cos((pi)*cos(theta)));
af=af/2; %normalize
%Calculating the nulls of the plot
syms x
nulls = solve((sin((3*pi/2)*cos(x))).*(2*cos((pi)*cos(x)))== 0,x);
disp("Nulls occur at : ");
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
disp("Maximas occur at : ");
for i=1:length(maximas)
temp = theta(maximas(i))*180/pi;
fprintf("%d) %.3f Degrees\n",i,temp);
end
fprintf('\n');
N = length(theta);
rad_pat = [];
for i=1:N
rad_pat(i) =abs((sin((3*pi/2)*cos(theta(i)))*(2*cos((pi)*cos(theta(i)))))/2);
end
%Calculating Half Power Beam Width
hpbw = abs(180*2*(1 -acos((1.391*lambda)/(pi*N*d)))/pi);
fprintf("Half Power Beam Width: %.3f Degrees\n", hpbw);
fprintf('\n');
%Calculating directivity
D = 4*N*d/lambda;
fprintf("Directivity : %.3f\n", D);
D = 10*log10(D);
fprintf("in dB : %.3f dB \n",D);
polarplot(theta,rad_pat,'b','LineWidth',2);
title('Polar Plot of P radiated');
set(gca,'FontSize',15);