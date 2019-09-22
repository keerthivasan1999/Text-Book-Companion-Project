clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
SG=0.85                 //SG is specific gravity of the fluid
h=55                    //h is the manometer column height in 'cm'
P_atm=96                //P_atm is atmospheric pressure in 'kPa'


//Unit conversion
h=h/100                 //Conversion form 'cm' to 'm'


//Assumption
g=9.81                  //g is acceleration due to gravity in 'm/s2'
rho_H2O=1000            //rho_H2O is water density in 'kg/m3'


//Calculation
rho=SG*rho_H2O          //rho is density of the manometer fluid in 'kg/m3'
P=P_atm+(rho*h*g/1000)  //P is absolute pressure within the tank in 'kPa'
//Division by 1000 on the second term of above equation R.H.S is to convert 'Pa' present in the second term to 'kPa'


//Display of result
mprintf("The absolute pressure within the tank is %.1f kPa.",P)
