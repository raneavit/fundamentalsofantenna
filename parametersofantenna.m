%% 1. To plot the Radiation Pattern. 2. To compute HPBW. 3. To compute FNBW. 4. To compute Directivity. 5. To compute Gain%%
clear all;
clc;
close all;
%Polar Plot
theta = [0:0.01:pi];
N = length(theta);
rad_pat = [];
for i=1:N
rad_pat(i) = (sin(theta(i)))^2
end
polar(theta,rad_pat);
title('Polar Plot of P radiated');
set(gca,'FontSize',15);
%Input from user
Prad = input(“Enter Power Radiated”);
r = input(“Enter the distance”);
%Calculating Bo
u = @(x,y)(sin(x)).^2.*sin(x);
ymax = 2*pi;
q = integral2(u,0,pi/2,0,ymax);
B0 = Prad/q;
disp("Value of B0 ie. Max value of U : "+ num2str(B0)+ " W/steradian");
%Calculating Maximum Power Density
W = B0/(r^2);
disp("Value of Maximum Power density : "+ num2str(W)+ " W/m^2");
%Calculating Directivity
D = 4*pi*B0/Prad;
Ddb = 10*log10(D);
disp("Value of Directivity : "+num2str(D)+ " or "+ num2str(Ddb)+ " dB");
disp("Since the antenna is lossless gain is the same as D");
%Gain Value
disp("Value of Gain : "+num2str(D)+ " or "+ num2str(Ddb)+ " dB");
%Calculating HPBW
h=nthroot((0.5/B0),2);
HPBW=2*(90-asind(h));
disp("Half power beam width is: "+num2str(HPBW)+" degrees")
%Calculating FNBW
p=nthroot((0/B0),2);
FNBW = 2*(90-asind(p));
disp("First null beam width is: "+num2str(FNBW)+" degrees")
clear all;