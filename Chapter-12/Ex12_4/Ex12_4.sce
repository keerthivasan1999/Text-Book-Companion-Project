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
T_star=(2/(k+1))*T_0            //T_star is the critical temperature in 'K'
P_star=(2/(k+1))^(k/(k-1))*P_0  //P_star is critical pressure in 'kPa'


//Display of result
mprintf('\nCritical temperature is %d K.\nCritical pressure is %d kPa.',T_star,P_star)
//The answers vary due to round off error
