//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                                                //To clear the console screen
clear;                                                              //To clear all the existing variables in the memory


//Let '1' and '2' be the same naming notations as shown in 12-35 page number 638.
//Given data
P_in=1                                                              //P_in is pressure of air at nozzle inlet in 'MPa'
T_in=800                                                            //T_in is temperature of air at nozzle inlet in 'K'
k=1.4                                                               //k is specific heat ratio
Ma_1=2                                                              //Ma_e is exit Mach number
A_star=20                                                           //A_star is the throat area in 'cm2'
V_in=0                                                              //V_in is air velocity at the nozzle inlet in 'm/s'


//Assumption
R=0.287                                                             //R is gas constant in '(kPa m3)/(kg K)'
Ma_star=1                                                           //Ma is Mach number at the throat
C_p=1.005                                                           //C_p is constant pressure specific heat in 'kJ/(kg K)'


//Calculation
P_01=P_in;                                                          //P_0 is stagnation pressure in 'MPa'
T_01=T_in;                                                          //T_0 is stagnation temperature in 'K'
P_1_Ratio=(1+(0.5*(k-1)*Ma_1^2))^(-k/(k-1))                         //P_1_Ratio is static pressure ratio before the shock
T_1_Ratio=(1+(0.5*(k-1)*Ma_1^2))^(-1)                               //T_1_Ratio is static temperature ratio before the shock
rho_1_Ratio=(1+(0.5*(k-1)*Ma_1^2))^(-1/(k-1))                       //rho_1_Ratio is static density ratio before the shock
//P_1_Ratio, T_1_Ratio and rho_1_Ratio are calculated using the formulas given in Page 899 APPENDIX 1.
rho_0=(P_01*1000)/(R*T_01)                                          //rho_0 is stagnation density in 'kg/m3'
//Multiplication by 1000 on the numerator of the above equation R.H.S is to convert P_01 from 'MPa' to 'kPa'
P_1=P_1_Ratio*P_01                                                  //P_1 is static pressure before the shock in 'MPa'
T_1=T_1_Ratio*T_01                                                  //T_1 is static temperature before the shock in 'K'
rho_1=rho_1_Ratio*rho_0                                             //rho_1 is satic density before the shock in 'kg/m3'
Ma_2=sqrt((((k-1)*Ma_1^2)+2)/((2*k*Ma_1^2)-k+1))                    //Ma_2 is Mach number after the shock
P_2_by_P_1=(1+(k*Ma_1^2))/(1+(k*Ma_2^2))                            //P_2_by_P_1 is static pressure ratio after the shock
P_02_by_P_01=(Ma_1/Ma_2)*((1+(Ma_2^2*0.5*(k-1)))/(1+(Ma_1^2*0.5*(k-1))))^((k+1)/(2*(k-1)))//P_02_by_P_01 is stagnation pressure ratio after the shock
T_2_by_T_1=(2+(Ma_1^2*(k-1)))/(2+(Ma_2^2*(k-1)))                    //T_2_by_T_1 is static temperature ratio after the shock
rho_2_Ratio=((k+1)*Ma_1^2)/(2+(Ma_1^2*(k-1)))                       //rho_2_ratio is static density ratio after the shock
//Ma_2, P_2_by_P_1, P_02_by_P_01, T_2_by_T_1 and rho_2_Ratio are calculated using the formulas given in Page 899 APPENDIX 1.
P_02=P_02_by_P_01*P_01                                              //P_02 is stagnation pressure after the shock in 'MPa'
P_2=P_2_by_P_1*P_1                                                  //P_2 is static pressure after the shock in 'MPa'
T_2=T_2_by_T_1*T_1                                                  //T_2 is static temperature after the shock in 'K'
rho_2=rho_2_Ratio*rho_1                                             //rho_2 is satic densoty after the shock in 'kg/m3'


//Display of result
mprintf('\n(a) Stagnation pressure after shock is %.3f MPa.\n    Static pressure after shock is %.3f MPa.\n    Static temperature after shock is %d K.\n    Static density after shock is %.2f kg/m3.',P_02,P_2,T_2,rho_2)
//The answers vary due to round off error


//Part (b)
//Calculation
delta_s=(C_p*log(T_2_by_T_1))-(R*log(P_2_by_P_1))                   //delta_s is entropy change across the shock in 'kJ/(kg K)'


//Display of result
mprintf('\n\n(b) The entropy change across the shock is %.4f kJ/(kg K).',delta_s)


//Part (c)
//Calculation
V_2=Ma_2*sqrt(k*R*T_2*1000)                                         //V_2 is air velocity after the shock in 'm/s'
//Multiplication by 1000 on the R.H.S of the above equation is to convert 'kJ/kg' present in the above to 'm2/s2'


//Display of result 
mprintf('\n\n(c) Air velocity after shock is %d m/s.',V_2)
//The answers vary due to round off error


//Part (d)
//Calculation
rho_star_ratio=(1+(0.5*(k-1)*Ma_star^2))^(-1/(k-1))                 //rho_star_Ratio is throat density ratio
T_star_ratio=(1+(0.5*(k-1)*Ma_star^2))^(-1)                         //T_star_Ratio is throat temperature ratio
//rho_star_ratio and T_star_ratio are calculated using the formulas given in Page 899 APPENDIX 1.
T_star=T_star_ratio*T_01                                            //T_star is temperature at throat in 'K'
rho_star=rho_star_ratio*rho_0                                       //rho_star is density at throat in 'kg/m3'
v_star=sqrt(k*R*T_star*1000)                                        //V_star is velocity at throat in 'm/s'
m=rho_star*A_star*v_star/1E4                                        //m is mass flow rate in 'kg/m3'


//Display of result
mprintf('\n\n(d) Mass flow rate after shock is %.2f kg/s.',m)
