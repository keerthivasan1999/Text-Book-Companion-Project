//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
m=3                         //m is mass flow rate of carbon dioxide in 'kg/s'
P_0=1400                    //P_0 is pressure at the duct enterance in 'kPa'
T_0=200                     //T_0 is temperature at the duct enterance in '°C'
P_1=200                     //P_1 is pressure at the duct exit in 'kPa'
delta_P=200                 //delta_P is the pressure drop in 'kPa'


//Assumption
C_p=0.846                   //C_P is constant pressure specific heat in 'kJ/(kg K)'
k=1.289                     //k is specific heat ratio
R=0.1889                    //R is gas constant in 'kJ/(kg K)'


//Unit conversion
T_0=T_0+273                 //Conversion from '°C' to 'K'


//Calculation
P=P_0-delta_P               //P is the pressure after the pressure drop in 'kPa'
T=T_0*(P/P_0)^((k-1)/k)     //T is temperature at the location corresponds to given pressure drop 'delta_P' in 'K'
V=sqrt(2*C_p*(T_0-T)*1000)  //V is velocity of the carbon dioxide in 'm/s'
//Multipilcation by '1000' inside the square root is to convert the 'kJ/kg' present inside the square root to 'm2/s2'.
rho=P/(R*T)                 //rho is density of the carbon dioxide in 'kg/m3'
A=m/(rho*V)                 //A is the area of the duct in 'm2'
A=A*1E4                     //Conversion from 'cm2' to 'm2'
C=sqrt(k*R*T*1000)          //C is speed of sound in air in 'm/s'
//Multipilcation by '1000' inside the square root is to convert the 'kJ/kg' present inside the square root to 'm2/s2'.
Ma=V/C                      //Ma is Mach number


//Display of result
mprintf('\nVelocity is %.1f m/s.\nDensity is %.1f kg/m3.\nArea is %.1f cm2.\nMach number is %.3f.',V,rho,A,Ma)
//The answers vary due to round off error
