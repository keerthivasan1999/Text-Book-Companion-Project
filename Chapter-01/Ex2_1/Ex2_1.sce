clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
T=25                //T is temperature of the room in '°C'
P=100               //P is pressure of the room in 'kPa'
L=4                 //L is the length of the room in 'm'
B=5                 //B is the breath of the room in 'm'
W=6                 //W is the width of the room in 'm'


//Calculation
rho=P*28.97/8.314/(273+T) //rho is air density in 'kg/m3'
SG=rho/1000               //Dimensionless quantity (Specific gravity=density of air/density of water)
V=L*B*W                   //V is the volume of the air in 'm3'
m=rho*V                   //m is the mass of the air in 'kg'


//Display of result
printf("\nDensity of the air in the room is %.2f kg/m3.\nSpecific gravity of the air is %.5f.\nMass of air in the room is %.d kg.",rho,SG,m)
