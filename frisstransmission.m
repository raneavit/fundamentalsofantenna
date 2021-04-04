%Friss Transmission Equation, input power = 150w, freq = 2 GHz, distance from antenna r = 1 km
clear all;
clc;
close all;
disp("Wave travelling in z-direction")
Pin=input("Input Power in Watts:- ");
Freq=input("Operating Frequency in Ghz:- ");
r=input("Separation between antennas in km:- ");
polar1=input("Polarization of Transmitting Antenna input[Please enter vector coefficients in square bracket with space]:- ");
polar2=input("Polarization of Receiving Antenna input[Please enter vector coefficients in square bracket with space]:- ");
p1= polar1/norm(polar1);
p2= polar2/norm(polar2);
Ex1=polar1(1);Ey1=polar1(2);
phi=angle(Ey1)-angle(Ex1);
if abs(Ex1)==abs(Ey1) && phi==pi/2
ptype1="CW Circular Polarization";
elseif abs(Ex1)==abs(Ey1) && phi==-pi/2
ptype1="CCW Circular Polarization";
elseif abs(Ex1)~=abs(Ey1) && phi==pi/2
ptype1="CW Elliptical Polarization";
elseif abs(Ex1)~=abs(Ey1) && phi==-pi/2
ptype1="CCW Elliptical Polarization";
elseif Ex1~=0 && Ey1~=0 && phi==pi || phi==0
ptype1="Linear Polarization";
else
ptype1="Invalid";
end
Ex2=polar2(1);Ey2=polar2(2);
phi2=angle(Ey2)-angle(Ex2);
if abs(Ex2)==abs(Ey2) && phi2==pi/2
ptype2="CW Circular Polarization";
elseif abs(Ex2)==abs(Ey2) && phi2==-pi/2
ptype2="CCW Circular Polarization";
elseif abs(Ex2)~=abs(Ey2) && phi2==pi/2
ptype2="CW Elliptical Polarization";
elseif abs(Ex2)~=abs(Ey2) && phi2==-pi/2
ptype2="CCW Elliptical Polarization";
elseif phi2==pi || phi2==0
ptype2="Linear Polarization";
else
ptype2="Invalid";
end
PLF= (dot(p1,p2))^2;
choice=input("Input 0 to solve with Gain, 1 to solve with Directivity");
switch choice
case 0
Tx=input("Transmission antenna Gain in dB:- ");
Rx=input("Receiving antenna Gain in dB:- ");
Gt=10^(Tx/10);
Gr=10^(Rx/10);
Lambda=(3*10^(8))/(Freq*10^9);
Prad=Pin*((Lambda/(4*pi*(r*1000)))^2)*Gt*Gr*PLF;
disp("Power received :- "+ num2str(Prad)+ " watts");
VarNames = {'Power Transmitted in Watts', 'Power Received in Watts', 'Tx Polarization', 'Rx Polarization', 'PLF'};
fprintf('\n');
T = table(Pin ,Prad, ptype1, ptype2, PLF, 'VariableNames',VarNames);
disp(T);
case 1
Tx=input("Transmission antenna Directivity in dB:- ");
Rx=input("Receiving antenna Directivity in dB:- ");
ecd=input("Enter Radiation efficiency ecd:-");
n=input("Enter Reflection coefficient:-");
Dt=10^(Tx/10);
Dr=10^(Rx/10);
er=1-(n)^2;
Lambda=(3*10^(8))/(Freq*10^9);
Prad=Pin*((Lambda/(4*pi*(r*1000)))^2)*er*ecd*Dt*Dr*PLF;
disp("Power received:- "+ num2str(Prad)+ " watts");
VarNames = {'Power Transmitted in Watts', 'Power Received in Watts', 'Tx Polarization', 'Rx Polarization', 'PLF', 'Radiation Efficiency(ecd)','Reflection Efficiency(er)'};
T = table(Pin ,Prad, ptype1, ptype2, PLF, ecd, er, 'VariableNames',VarNames);
fprintf('\n');
disp(T);
otherwise
disp('Please input valid selection')
end