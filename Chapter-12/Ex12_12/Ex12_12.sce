//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                //To clear the console screen
clear;                              //To clear all the existing variables in the memory
exec('.\fsolve11.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve11.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-49 page number 647.
//Given data
Ma_1=2                              //Ma_1 is upstream Mach number of super sonic air
P_1=230                             //P_1 is pressure of super sonic air in 'kPa'
delta=10                            //delta is wall expansion angle in '°(degree)'


//Assumption
k=1.4                               //k is specific heat ratio


//Calculation
theta=delta;                        //theta is total defletion angle in '°(degree)'
Nu_Ma1=(sqrt((k+1)/(k-1))*atan(sqrt((k-1)/(k+1)*(Ma_1^2-1))))-(atan(sqrt(Ma_1^2-1))) //Nu_Ma1 is upstream Prandtl-Meyer function in '°(degree)'
Nu_Ma1=Nu_Ma1*180/%pi               //Conversion from 'radian' to '°(degree)'
Nu_Ma2=theta+Nu_Ma1                 //Nu_Ma2 is downstream Prandtl-Meyer function in '°(degree)'
Ma_2_guess=2                        //Ma_2_guess is guess downstream Mach number which is used calculate actual downstream Mach number using fsolve function
Ma_2=fsolve(Ma_2_guess,fsolve11)    //Using fsolve function to find the downstream Mach number.
P_2=((1+(0.5*(k-1)*Ma_2^2))/(1+(0.5*(k-1)*Ma_1^2)))^(-k/(k-1))*P_1 //P_2 is downstream pressure in 'kPa'


//Display of result 
mprintf('\nDownstream Mach number is %.3f.\nDownstream pressure is %d kPa.',Ma_2,P_2)
