//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                            //To clear the console screen
clear;                          //To clear all the existing variables in the memory
exec('.\fsolve9.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve9.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-25 page number 629
//Given data
T_1=400                         //T_1 is temperature of the nitrogen at duct inlet in 'K'
P_1=100                         //P_1 is pressure of the nitrogen at duct inlet in 'kPa'
Ma1=0.3                         //Ma1 is Mach number at duct inlet
Area_drop=20                    //Area_drop is percentage drop in area


//Assumption
k=1.4                           //k is specific heat ratio


//Calculation
A_1_ratio=(1/Ma1)*((2/(k+1))*(1+(0.5*Ma1^2*(k-1))))^((0.5*(k+1))/(k-1))//A_1_ratio is inlet area ratio
T_1_ratio=(1+(0.5*(k-1)*Ma1^2))^(-1)            //T_1_ratio is inlet temperature ratio
P_1_ratio=(1+(0.5*(k-1)*Ma1^2))^(-k/(k-1))      //P_1_ratio is inlet pressure ratio
//A_1_ratio,T_1_ratio and P_1_ratio are calculated using the formulas given in Page number 899 APPENDIX 1.
A_2_ratio=(1-(Area_drop/100))*A_1_ratio         //A_2_ratio is area ratio where area drop is 'Area_drop'
Ma2_guess=0.5                                   //Ma2_guess is guess Mach number and it is used to find actual Mach number using fsolve function
Ma2=fsolve(Ma2_guess,fsolve9)                   //Calling of fsolve function
T_2_ratio=(1+(0.5*(k-1)*Ma2^2))^(-1)            //T_2_ratio is temperature ratio where area drop is 'Area_drop'
P_2_ratio=(1+(0.5*(k-1)*Ma2^2))^(-k/(k-1))      //P_2_ratio is pressure ratio where area drop is Area_drop
//T_2_ratio,P_2_ratio are calculated using the formulas given in Page number 899 APPENDIX 1.
T_2=T_1*(T_2_ratio/T_1_ratio);                  //T_2 is temperature at the desired location in 'K'
P_2=P_1*(P_2_ratio/P_1_ratio);                  //P_2 is pressure at the desired location in 'kPa'


//Display of result
mprintf('\nTemperature at the desired location is %d K.\nPressure at the desired location is %.1f kPa.',T_2,P_2)
//The answers vary due to round off error
