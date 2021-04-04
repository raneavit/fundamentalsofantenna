%Pyramidal Horn Antenna
clear all;
clc;
close all;
f=input("Enter Operating Frequency in GHz:- ");
aE1=input("Enter E-plane aperture");
a=input("Dimension of rectangular waveguide in E-plane:- ");
b=input("Dimension of rectangular waveguide in H-plane:- ");
lambda=(3*10^(8))/(f*10^9);
aE=aE1*lambda;
deltaE=a*lambda;
deltaH=b*lambda;
l=(aE*aE)/(8*deltaE);
disp("Length of horn antenna:- "+num2str(l));
aH=sqrt(l*8*deltaH);
disp("H-Plane Aprerture:- "+num2str(aH));
b1=aE/(2*l);
c=aH/(2*l);
thetaE=2*(atan(b1))*(180/pi);
disp("Flare angle in E-plane:- "+num2str(thetaE));
thetaH=2*(atan(c))*(180/pi);
disp("Flare angle in H-plane:- "+num2str(thetaH));
HPBWE=56/aE;
disp("HPBW in E-plane:- "+num2str(HPBWE));
HPBWH=67/aH;
disp("HPBW in H-plane:- "+num2str(HPBWH));
FNBWE=115/aE;
disp("FNBW in E-plane:- "+num2str(FNBWE));
FNBWH=172/aH;
disp("FNBW in H-plane:- "+num2str(FNBWH));
Ap=aE*aH;
D=10*(log10(7.5*Ap));
disp("Directivity:- "+num2str(D));
VarNames = {'Length(m)', 'H-plane Aperture(m)', 'Flare angle in E-plane(deg)', 'Flare angle in H-plane(deg)','HPBW E-plane(deg)','HPBW H-plane(deg)','FNBW E-plane(deg)','FNBW H-plane(deg)','Directivity(dB)'};
T = table(l ,aH, thetaE, thetaH, HPBWE, HPBWH, FNBWE, FNBWH, D, 'VariableNames',VarNames);
disp(T);