//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
P=1                     //P is pressure in 'atm'
T=70                    //T is temperature in '°F'
V=60                    //V is velocity in 'mi/h'
A=22.26                 //A is frontal area in 'ft2'
F_D=66                  //F_D is force acting on the car in 'lbf'


//Unit conversion
V=V*1.467               //Conversion from 'mi/h' to 'ft/s'
F_D=F_D*32.2            //Conversion from 'lbf' to '(lbm ft)/s2'


//Assumption
rho=0.07489             //rho is density of the air in 'lbm/ft3'


//Calculation
CD=2*F_D/(rho*A*V^2)    //CD is the discharge co-efficient


//Display of result
mprintf('\nDrag co-efficient of the car is %.2f.',CD)
//The answers vary due to round off error
