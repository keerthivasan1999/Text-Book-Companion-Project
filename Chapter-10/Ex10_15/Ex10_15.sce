//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
T=20                        //T is the temperature of the air in '°C'
P=101325                    //P is the pressure of the air in 'Pa'
L=1.8                       //L is the length of the test section in 'm'
W=0.50                      //W is the width of the test section in 'm'
Delta1=4.2                  //Delta1 is the boundary layer thickness in 'cm'
Delta2=7.7                  //Delta2 is the boundary layer thickness in 'cm'


//Assumption
Nu=1.516E-5                 //Nu is the kinematic viscosity of air in 'm2/s'
rho=1.204                   //rho is the density of air in 'kg/m3'
U=10.0                      //U is the velocity component parallel to the wall at a location just above the boundary layer in 'm/s'


//Unit conversion
Delta1=Delta1/100           //Conversion from 'cm' to 'm'
Delta2=Delta2/100           //Conversion from 'cm' to 'm'


//Calculation
F_D=W*rho*U^2*(4/45)*(Delta2-Delta1)//F_D is the drag force in 'N'


//Display of result
mprintf('\nThe drag force is %.2f N.',F_D)
