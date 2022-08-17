//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
P_0=1                   //P_0 is air pressure at the nozzle inlet in 'MPa'
T_0=600                 //T_0 is air temperature at the nozzle inlet in '°C'
V_0=150                 //V_0 is air velocity at the nozzle inlet in 'm/s'
A=50                    //A is nozzle throat area in 'cm2'
P_b_1=0.7               //P_b_1 is the back pressure in 'MPa'
P_b_2=0.4               //p_b_2 is the back pressure in 'MPa'


//Unit conversion
T_0=T_0+273             //Conversion from '°C' to 'K'
A=A*1E-4                //Conversion from 'cm2' to 'm2'



//Assumption
C_p=1.005               //C_P is constant pressure specific heat in 'kJ/(kg K)'
k=1.4                   //k is specific heat ratio
R=0.287                 //R is gas constant in '(kPa m3)/(kg K)'


//Part (a)
//Calculation
T_0i=T_0+(V_0^2/(2*C_p))/1000                           //T_0i is stagnation temperature at the nozzle inlet is 'K'
//Division by 1000 on the second term of above equation R.H.S is to convert 'm2/s2' present in the second term to 'kJ/kg'.
P_0i=P_0*(T_0i/T_0)^(k/(k-1))                           //P_0i is stagnation pressure at the nozzle inlet in 'MPa'
T_0=T_0i;                                               //K
P_0=P_0i;                                               //MPa
P_c_Ratio=(2/(k+1))^(k/(k-1))                           //P_c_Ratio is the critical pressure ratio
P_b_Ratio=P_b_1/P_0;                                    //P_b_Ratio is the back pressure ratio
if P_b_Ratio>P_c_Ratio then
    P_t=P_b_1;                                          //P_t is throat pressure in 'MPa'
    flow1="not choked";
    Ma1=((2*((P_b_Ratio)^((1-k)/k)-1))/(k-1))^0.5       //Ma1 is Mach number
    T_t_Ratio=(1+(Ma1^2*(k-1)*0.5))^(-1)                //T_t_Ratio is throat temperature ratio
    //Ma1 and T_t_Ratio is calculated using the formulas given in Page 899 APPENDIX 1.
    T_t=T_t_Ratio*T_0                                   //T_t is temperature at throat in 'K'
    rho_t=P_t*1000/(R*T_t)                              //rho_t is density at throat in 'kg/m3'
    V_t=Ma1*sqrt(k*R*T_t*1000)                          //V_t is velocity at throat in 'm/s'
    m1=rho_t*A*V_t                                      //m1 is mass flow rate through the nozzle in kg/s
else
     flow1="choked";
     Ma1=1;                                             //Ma1 is Mach number
     m1=A*(P_0*1000)*sqrt(k/(R*T_0))*(2/(k+1))^((k+1)/(2*(k-1))) //m1 is mass flow rate through the nozzle in 'kg/s'
end


//Display pf result
mprintf('\n(a) Mass flow rate is %.2f kg/s.',m1)


//Part (b)
//Calculation
P_b_Ratio=P_b_2/P_0                                     //P_b_Ratio is the back pressure ratio
if P_b_Ratio>P_c_Ratio then
    P_t=P_b_2;                                          //P_t is throat pressure in 'MPa'
    flow2="not choked";
    Ma1=((2*((P_b_Ratio)^((1-k)/k)-1))/(k-1))^0.5       //Ma1 is Mach number
    T_t_Ratio=(1+(Ma1^2*(k-1)*0.5))^(-1)                //T_t_Ratio is throat temperature ratio
    //Ma1 and T_t_Ratio is calculated using the formulas given in Page 899 APPENDIX 1.
    T_t=T_t_Ratio*T_0;                                  //T_t is temperature at throat in 'K'
    rho_t=P_t*1000/(R*T_t);                             //rho_t is density at throat in 'kg/m3'
    V_t=Ma1*sqrt(k*R*T_t*1000)                          //V_t is velocity at throat in 'm/s'
    m2=rho_t*A*V_t                                      //m2 is mass flow rate through the nozzle in kg/s
else
     flow2="choked";
     Ma2=1;                                             //Ma2 is Mach number
     m2=A*(P_0*1000)*sqrt(k/(R*T_0))*(2/(k+1))^((k+1)/(2*(k-1))) //m2 is mass flow rate through the nozzle in kg/s
end
m2=m2*sqrt(1000)                                        //Conversion from '(kPa m2)/sqrt(kJ/kg)' to 'kg/s'


//Display of result
mprintf('\n(b) Mass flow rate is %.2f kg/s.',m2)
//The answers vary due to round off error
