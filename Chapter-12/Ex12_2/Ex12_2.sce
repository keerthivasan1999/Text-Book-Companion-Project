//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory


//Given data
V=200               //V id  velocity of the air in 'm/s'
T=30                //T is air temperature in '°C'   


//Unit conversion
T=T+273             //Conversion from '°C' to 'K'


//Assumption 
R=0.287             //R is gas constant in 'kJ/(kg K)'
k=1.4               //k is specific heat ratio



//Part (a)
//Calculation
C=sqrt(k*R*T*1000)  //C is speed of sound in air in 'm/s'
//Multipilcation by 1000 inside the square root is to convert the kJ/kg present inside the square root to m2/s2.


//Display of result
mprintf('\n(a) Speed of sound in air is %d m/s.',C)


//Part (b)
//Calculation
Ma=V/C              //Ma is Mach number


//Display of result
mprintf('\n(b) The Mach number is %.3f.',Ma)
//The answers vary due to round off error
