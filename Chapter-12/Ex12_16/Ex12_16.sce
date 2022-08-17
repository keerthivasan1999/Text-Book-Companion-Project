//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                                //To clear the console screen
clear;                                              //To clear all the existing variables in the memory
exec('.\fsolve13.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve13.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-66 page number 664.
//Given data
Ma_1=0.4                                            //Ma_1 is Mach number at the inlet
Ma_2=1                                              //Ma_2 is Mach number at the exit
T_1=300                                             //T_1 is inlet air temperature in 'K'
D=3                                                 //D is diameter of the duct in 'cm'
P_1=150                                             //P_1 is inlet air pressure in 'kPa'


//Assumption
k=1.4                                               //k is specific heat ratio
C_p=1.005                                           //C_p is constant pressure specific heat in 'kJ/(kg K)'
R=0.287                                             //R is gas constant in 'kJ/(kg K)'
Nu=1.58E-5                                          //Nu is kinematic viscosity of the air in 'm2/s'
epsilon=0                                           //epsilon is roughness of the duct in 'm'


//Unit conversion
D=D/100                                             //Conversion from 'cm' to 'm'


//Calculation
epsilon_by_D=epsilon/D;                             //epsilon_by_D is roughness factor
C_1=sqrt(k*R*T_1*1000)                              //C_1 is speed of light in the air in 'm/s'
//Multipilcation by '1000' inside the square root is to convert the 'kJ/kg' present inside the square root to 'm2/s2'.
V_1=Ma_1*C_1                                        //V_1 is the inlet air velocity in 'm/s'
Re_1=V_1*D/Nu                                       //Re_1 is the inlet Reynolds number
f0=0.01                                             //f0 is guess friction factor and it is used to determine the actual friction factor using fsolve function
f=fsolve(f0,fsolve13)                               //fsolve function calling statement to determine the friction factor
stag_P_1_ratio=(1/Ma_1)*((2+((k-1)*Ma_1^2))/(k+1))^((k+1)/(2*(k-1)))//stag_P_1_ratio is inlet stagnation pressure ratio
T_1_ratio=(k+1)/(2+((k-1)*Ma_1^2))                  //T_1_ratio is inlet temperature ratio
P_1_ratio=(1/Ma_1)*((k+1)/(2+((k-1)*Ma_1^2)))^0.5   //P_1_ratio is inlet pressure ratio
V_1_ratio=Ma_1*((k+1)/(2+((k-1)*Ma_1^2)))^0.5       //V_1_ratio is inlet velocity raito
fl_by_D=((1-Ma_1^2)/(k*Ma_1^2))+(((k+1)/(2*k))*log(((k+1)*Ma_1^2)/(2+((k-1)*Ma_1^2))))//fl_by_D is inlet pipe number
//stag_P_1_ratio, T_1_ratio, P_1_ratio, V_1_ratio and fl_by_D are calculated using the formulas given in Page 902 APPENDIX 1.
L_1_star=fl_by_D*D/f                                //L_1_star is the duct length in 'm'
T_star=T_1/T_1_ratio                                //T_star is exit pressure in 'K'
P_star=P_1/P_1_ratio                                //P_star is exit pressure in 'kPa'
V_star=V_1/V_1_ratio                                //V_star is exit velocity in 'm/s'
FractionLost=1-1/stag_P_1_ratio


//Display of Re_1sult
mprintf('\nDuct length is %.2f m.\nExit temperature is %d K.\nExit pressure is %.1f kPa.\nExit Velocity is %d m/s.\nFraction of stagnaion pressure lost is %.3f or %.1f Percentage.',L_1_star,T_star,P_star,V_star,FractionLost,FractionLost*100)
//The answers vary due to round off error
