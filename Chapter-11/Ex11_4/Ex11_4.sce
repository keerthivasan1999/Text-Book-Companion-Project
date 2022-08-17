//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
D=2.2                   //D is outer diameter of the pipe in 'cm'
L=30                    //L is width of the river in 'm'
V=4                     //V is average flow velocity of water in 'm/s'
T=15                    //T is water temperature in '°C'


//Assumption
rho=999.1               //rho is density of the water in 'kg/m3'
Mu=1.138E-3             //Mu is dynamic visocity of the water in 'kg/(m s)'


//Unit conversion
D=D/100                 //Conversion from 'cm' to 'm'


//Calculation
Re=rho*V*D/Mu           //Re is the dimensionLes reynolds number
CD=1                    //This value is obtained from the FIGURE 11-34 page number 585. When input parameters are changed, 'Re' changes. So change 'CD' accordingly to the new 'Re' using FIGURE 11-34.
A=L*D                   //A is the frontal area for flow past the cylinder in 'm2'
F_D=CD*A*rho*V^2/2      //F_D is the drag force acting on the pipe in 'N'


//Display of result
mprintf('\nThe drag force acting on the pipe is %d N.',F_D)
//The answers vary due to round off error
