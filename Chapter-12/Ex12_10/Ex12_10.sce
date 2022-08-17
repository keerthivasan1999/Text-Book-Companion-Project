//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data 
Ma_experimental=3       //Ma_experimental is the experimental Mach Number


//Assumption
Mu=19                   //Mu is angle of Mach lines in the free stream flow in '°(degree)'


//Unit conversion
Mu=Mu*%pi/180           //Conversion from '°(degree)' to 'radian'


//Calculation
Ma_estimated=1/sin(Mu)  //Ma_estimated is the estimated Mach number


//Display of result
mprintf('\nEstimated Mach number is %.2f.\nExperimental Mach number is %d.',Ma_estimated,Ma_experimental)
if abs(Ma_estimated-Ma_experimental)<0.1 then
    mprintf('\nOur estimated Mach number agrees with the experimental Mach number.')
else 
    mprintf('\nOur estimated Mach number do not agrees with the experimental Mach number.')
end



