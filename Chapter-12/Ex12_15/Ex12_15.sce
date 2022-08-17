//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                            //To clear the console screen
clear;                                          //To clear all the existing variables in the memory
exec('.\fsolve12.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve12.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-58 page number 656.
//Given data
D=15                                            //D is diameter of combustor in 'cm'
T_1=550                                         //T_1 is intlet temperature of compressed air in 'K'
P_1=480                                         //P_1 is inlet pressure of compressed air in 'kPa'
V_1=80                                          //V_1 is inlet velocity of compressed air in 'm/s'
HV=42000                                        //HV is heating value of fuel in 'kJ/kg'
AF=40                                           //AF is air-fuel mass ratio


//Unit conversion
D=D/100                                         //Conversion from 'cm' to 'm'


//Assumption
k=1.4                                           //k is specific heat ratio
C_p=1.005                                       //C_p is specific heat of air in 'kJ/(kg K)'
R=0.287                                         //R is gas constant in 'kJ/(kg K)'


//Calculation
rho_1=P_1/(R*T_1)                               //rho_1 is inlet air density in 'kg/m3'
A_1=%pi*D^2/4                                   //A_1 is cross-sectional area of the combustor in 'm2'
m_air=rho_1*A_1*V_1                             //m_air is inlet mass flow rate of air in 'kg/s'
m_fuel=m_air/AF                                 //m_fuel is mass flow rate of the fuel in 'kg/s'
Q=m_fuel*HV                                     //Q is the rate of heat transfer in 'kW'
q=Q/m_air                                       //q is heat transfer per 'kg' of air in 'kJ/kg'
Stag_T_1=T_1+(V_1^2/(2*C_p*1000))               //Stag_T_1 is inlet stagnation temperature in 'K'
//Division by '1000' on the second term of above equation RHS is to convert 'm2/s2' present in the second term to 'kJ/kg'.
C_1=sqrt(k*R*T_1*1000)                          //C_1 is speed of sound in air in 'm/s'
//Multipilcation by '1000' inside the square root is to convert the 'kJ/kg' present inside the square root to 'm2/s2'.
Ma_1=V_1/C_1                                    //Ma_1 is inlet Mach number
Stag_T_2=Stag_T_1+(q/C_p)                       //Stag_T_2 is exit stagnation temperature in 'K'
T_0_star=Stag_T_1*(1+(k*Ma_1^2))^2/((k+1)*Ma_1^2*(2+((k-1)*Ma_1^2)))//T_0_star is maximum stagnation temperature in 'K'
Stag_T_2_ratio=Stag_T_2/T_0_star                //Stag_T_2_ratio is exit stagnation temperature ratio
Ma_2_guess=0.3                                  //Ma_2_guess is guess exit Mach number and it is used to determine actual exit Mach number using fsolve function
Ma_2=fsolve(Ma_2_guess,fsolve12)                  //fsolve function is determine the exit Mach number
T_1_ratio=((Ma_1*(k+1))/(1+(k*Ma_1^2)))^2       //T_1_ratio is inlet temperature ratio
P_1_ratio=(1+k)/(1+(k*Ma_1^2))                  //P_1_ratio is inlet pressure ratio
V_1_ratio=((1+k)*Ma_1^2)/(1+(k*Ma_1^2))         //V_1_ratio is inlet velocity ratio
T_2_ratio=((Ma_2*(k+1))/(1+(k*Ma_2^2)))^2       //T_2_ratio is outlet temperature ratio
P_2_ratio=(1+k)/(1+(k*Ma_2^2))                  //P_2_ratio is outlet pressure ratio
V_2_ratio=((1+k)*Ma_2^2)/(1+(k*Ma_2^2))         //V_2_ratio is outlet velocity ratio
//T_1_ratio, P_1_ratio, V_1_ratio, T_2_ratio, P_2_ratio and V_2_ratio are calculated using the formulas given in Page 901 APPENDIX 1.
T_2=T_1*(T_2_ratio/T_1_ratio)                   //T_2 is exit temperature in 'K'
P_2=P_1*(P_2_ratio/P_1_ratio)                   //P_2 is exit pressure in 'kPa'
V_2=V_1*(V_2_ratio/V_1_ratio)                   //V_2 is exit velocty in 'm/s'


//Display of result
mprintf('\nExit Mach number is %.4f.\nExit temperature is %d K.\nExit pressure is %d kPa.\nExit velocity is %d m/s.',Ma_2,T_2,P_2,V_2)
//The answers vary due to round off error
