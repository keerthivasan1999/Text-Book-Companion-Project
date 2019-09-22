clc             //To clear the console screen
clear           //To clear all the existing variables in the memory


//Given data
g=9.81          //g is acceleration due to gravity in 'm/s2'
h=740           //h is barometric reading in 'mm Hg'
rho=13570       //rho is mercury density in 'kg/m3'


//Unit conversion
h=h/1000        //Conversion form 'mm' to 'm'


//Calculation
P_atm=rho*g*h   //P_atm is atmospheric pressure in 'Pa'
P_atm=P_atm/1000//Conversion from 'Pa' to 'kPa'


//Display of result
mprintf('The atmospheric pressure is %.1f kPa.',P_atm)
