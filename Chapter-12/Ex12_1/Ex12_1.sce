//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
V_1=250                 //V_1 is cruising speed of the aircraft in 'm/s'
h=5000                  //h is altitude in 'm'
P_1=54.05               //P_1 is atmospheric pressure in 'kPa'
T_1=255.7               //T_1 is the ambient air temperature in 'K'
P_02_by_P_01=8          //P_02_by_P_01 is the stagnation pressure ratio


//Assumption
C_p=1.005               //C_P is constant pressure specific heat in 'kJ/(kg K)'
k=1.4                   //k is specific heat ratio of air


//Part (a)
//Calculation
T_01=T_1+(V_1^2/(2*C_p))/1000   //T_01 is stagnation pressure at the compressor inlet in 'K'
//Division by '1000' on the second term of the R.H.S of the above equation is to convert 'm2/s2' present in the second term to 'kJ/kg'
P_01=P_1*(T_01/T_1)^(k/(k-1))   //P_01 is stagnation pressure at the compressor inlet in 'kPa'


//Display of result
mprintf('\n(a) Stagnation pressure at the inlet of the compressor is %.2f kPa.',P_01)


//Part (b)
//Calculation
T_02=T_01*(P_02_by_P_01)^((k-1)/k)  //T_02 is stagnation temperature at the compressor exit in 'K'
W_in=C_p*(T_02-T_01)                //W_in is work supplied to the compressor in  'kJ/kg'


//Display of result
mprintf('\n(b) The work supplied to the compressor is %.1f kJ/kg.',W_in)
