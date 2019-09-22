clc             //To clear the console screen
clear           //To clear all the existing variables in the memory


//Given data
rho=1040        //rho is density of surface water in 'kg/m3'
H=4             //H is thickness of the gradient zone in 'm'
h1=0.8          //h1 is surface zone thickness in 'm'


//Assumption
g=9.81          //g is acceleration due to gravity in 'm/s2'


//Calculation
P1=rho*g*h1     //P1 is gage pressure at the bottom of the surface zone in 'Pa'
P=P1+(rho*g*4*H*asinh(tan((%pi*H)/(4*H)))/%pi)//P is gage pressure at the bottom of the gradient zone in 'Pa'
P=P/1000        //Conversion from 'Pa' to 'kPa'


//Display of result
mprintf('\nGage pressure at the bottom of the gradient zone is %.1f kPa (gage).',P)
