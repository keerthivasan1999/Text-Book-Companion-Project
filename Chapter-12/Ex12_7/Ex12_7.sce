//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                            //To clear the console screen
clear;                          //To clear all the existing variables in the memory


//Given data
P_in=1                          //P_in is pressure of air at nozzle inlet in 'MPa'
T_in=800                        //T_in is temperature of air at nozzle inlet in 'K'
k=1.4                           //k is specific heat ratio
Ma_e=2                          //Ma_e is exit Mach number
A_star=20                       //A_star is the throat area in 'cm2'
V_in=0                          //V_in is air velocity at the nozzle inlet in 'm/s'


//Assumption
R=0.287                         //R is gas constant in '(kPa m3)/(kg K)'
Ma=1                            //Ma is Mach number at the throat


//Calculation
P_0=P_in;                       //P_0 is stagnation pressure in 'MPa'
T_0=T_in;                       //T_0 is stagnation temperature in 'K'
rho_0=(P_0*1000)/(R*T_0)        //rho_0 is stagnation density in 'kg/m3'
//Multiplication by 1000 on the numerator of the above equation R.H.S is to convert P_0 from 'MPa' to 'kPa'


//Part (a)
P_star_Ratio=(1+(0.5*(k-1)*Ma^2))^(-k/(k-1))        //P_star_Ratio is throat pressure ratio
T_star_Ratio=(1+(0.5*(k-1)*Ma^2))^(-1)              //T_star_Ratio is throat temperature ratio
rho_star_Ratio=(1+(0.5*(k-1)*Ma^2))^(-1/(k-1))      //rho_star_Ratio is throat density ratio
//P_star_Ratio,T_star_Ratio and rho_star_Ratio are calculated using the formulas given in Page number 899 APPENDIX 1.
P_star=P_star_Ratio*P_0                             //P_star is pressure at throat in 'MPa'
T_star=T_star_Ratio*T_0                             //T_star is temperature at throat in 'K'
rho_star=rho_star_Ratio*rho_0                       //rho_star is density at throat in 'kg/m3'
V_star=sqrt(k*R*T_star*1000)                        //V_star is velocity at throat in 'm/s'
//Multiplication by 1000 on the R.H.S of the above equation is to convert 'kJ/kg' present in the above to 'm2/s2'


//Display of result
mprintf('\n(a) Pressure at throat is %.4f MPa.\n    Temperature at throat is %.1f K.\n    Density at throat is %.3f kg/m3.\n    Velocity at throat is %.1f m/s.',P_star,T_star,rho_star,V_star)
//The answers vary due to round off error


//Part (b)
P_e_Ratio=(1+(0.5*(k-1)*Ma_e^2))^(-k/(k-1))         //P_e_Ratio is exit pressure ratio
T_e_Ratio=(1+(0.5*(k-1)*Ma_e^2))^(-1)               //T_e_Ratio is exit temperature ratio
rho_e_Ratio=(1+(0.5*(k-1)*Ma_e^2))^(-1/(k-1))       //rho_e_Ratio is exit density ratio
Ma_e_star=Ma_e*sqrt((k+1)/(2+((k-1)*Ma_e^2)))       //A_e_Ratio is exit Mach number ratio
A_e_Ratio=(1/Ma_e)*((2/(k+1))*(1+(0.5*Ma_e^2*(k-1))))^((0.5*(k+1))/(k-1)) //A_e_Ratio is exit area ratio
//P_e_Ratio, T_e_Ratio, rho_e_Ratio, Ma_e_star and A_e_Ratio are calculated using the formulas given in Page number 899 APPENDIX 1.
P_e=P_e_Ratio*P_0                                   //P_e is exit pressure in 'MPa'
T_e=T_e_Ratio*T_0                                   //T_e is exit temperature in 'K'
rho_e=rho_e_Ratio*rho_0                             //rho_e is exit density in 'kg/m3'
A_e=A_e_Ratio*A_star                                //A_e is exit area in 'cm2'
V_e=Ma_e_star*V_star                                //V_e is exit velocity in 'm/s'


//Display of result
mprintf('\n\n(b) Pressure at exit is %.4f MPa.\n    Temperature at exit is %.1f K.\n    Density at exit is %.3f kg/m3.\n    Velocity at exit is %.1f m/s.\n    Exit area is %.2f cm2.',P_e,T_e,rho_e,V_e,A_e)
//The answers vary due to round off error


//Part (c)
m=rho_star*A_star*V_star/1E4                        //m is mass flow rate in 'kg/m3'
//Division by 1E4 on the R.H.S of the above equation is to convert area from 'cm2' to 'm2'


//Display of result
mprintf('\n\n(c) Mass flow rate is %.2f kg/s.',m)



