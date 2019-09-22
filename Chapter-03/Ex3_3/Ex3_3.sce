clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
h1=0.1                  //h1 is height of oil in 'm'
h2=0.2                  //h2 is height of water in 'm'
h3=0.35                 //h3 is height of mercury in 'm'
rho_water=1000          //rho_water is water density in 'kg/m3'
rho_oil=850             //rho_oil is oil density in 'kg/m3'
rho_mercury=13600       //rho_mercury is mercury density in 'kg/m3'
P_atm=85.6              //P_atm is atmospheric pressure in 'kPa'


//Assumption
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
P1=P_atm+(((g*rho_mercury*h3)-(g*rho_oil*h2)-(g*rho_water*h3))/1000)//P1 is air pressure in the tank in 'kPa'
//Division by 1000 on the second term of above equation is to convert 'Pa' present in the second term to 'kPa'


//Display of result
mprintf('Air pressure in the tank is %.1f kPa.',P1)
//The answer provided in the textbook is wrong
