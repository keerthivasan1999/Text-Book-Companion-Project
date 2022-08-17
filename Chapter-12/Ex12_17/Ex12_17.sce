//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                            //To clear the console screen
clear;                                          //To clear all the existing variables in the memory
exec('.\fsolve14.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve14.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-67 page number 665.
//Given data
L=27                                            //L is length of the duct in 'm'
D=5                                             //D is diameter of the duct in 'cm'
V_1=85                                          //V_1 is inlet air velocity in 'm/s'
T_1=450                                         //T_1 is inlet air temperature in 'K'
P_1=220                                         //P_1 is inlet air pressure in 'kPa'
f=0.023                                         //f is average friction factor for the duct


//Unit conversion
D=D/100                                         //Conversion from 'cm' to 'm'


//Assumption
k=1.4                                           //k is specific heat ratio
C_p=1.005                                       //C_p is constant pressure specific heat in 'kJ/(kg K)'
R=0.287                                         //R is gas constant in 'kJ/(kg K)'


//Calculation
C_1=sqrt(k*R*T_1*1000)                          //C_1 is speed of light in the air in 'm/s'
//Multipilcation by '1000' inside the square root is to convert the 'kJ/kg' present inside the square root to 'm2/s2'.
Ma_1=V_1/C_1                                    //Ma_1 is Mach number at the inlet
fl_star_by_D_in=((1-Ma_1^2)/(k*Ma_1^2))+(((k+1)/(2*k))*log(((k+1)*Ma_1^2)/(2+((k-1)*Ma_1^2))))
//fl_star_by_D_in is inlet pipe number calculated using sonic length instead of actual length
fl_by_D=f*L/D                                   //fl_by_D is actual pipe number
if fl_by_D<fl_star_by_D_in then
    flow="not choked"
    fl_star_by_D_out=(fl_star_by_D_in)-(fl_by_D)
    Ma_2_guess=1                                //'Ma_2_guess' is guess exit Mach number and it is used to determine the actual Mach number using fsolve function
    Ma_2=fsolve(Ma_2_guess,fsolve14)            //Function calling statement to determine the 'Ma_2'
else
    flow="chocked";
    Ma_2=1                                      //Ma_2 is Mach number at the exit
end
A_1=%pi*D^2/4                                   //A_1 is area of the duct in 'm2'
m_air=P_1*A_1*V_1/(R*T_1)                       //m_air is mass flow rate of air in 'kg/s'


//Display of result
mprintf('\nFlow is %s.\nThe Mach number at the duct exit is %.2f.\nThe mass flow rate of air is %.3f kg/s.',flow,Ma_2,m_air)
//The answers vary due to round off error
