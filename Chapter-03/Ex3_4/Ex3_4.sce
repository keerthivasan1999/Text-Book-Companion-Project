clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
h1=0.1                  //h1 is height of oil in 'm'
h2=0.2                  //h2 is height of water in 'm'
h3=0.35                 //h3 is height of mercury in 'm'
rho_water=1000          //rho_water is water density in 'kg/m3'
rho_oil=850             //rho_oil is oil density in 'kg/m3'
rho_mercury=13600       //rho_mercury is mercury density in 'kg/m3'
rho_seawater=1030       //rho_seawater is seawater density in 'kg/m3'
P_atm=85.6              //P_atm is atmospheric pressure in 'kPa'


//Unit conversion
P_atm=P_atm*1000        //Conversion from 'kPa' to 'Pa'


//Assumption
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
P1=P_atm+(((g*rho_mercury*h3)-(g*rho_oil*h2)-(g*rho_water*h3)))     //P1 is air pressure in the tank in 'Pa'
new_h3=((P1-P_atm)+(g*rho_oil*h2)+(g*rho_water*h3))/(g*rho_seawater)//new_h3 is differential fluid height in 'm'
P1=P1/1000              //Conversion from 'Pa' to 'kPa'


//Display of result
mprintf('\nAir pressure in the tank is %.1f kPa.',P1)
//The answer provided in the textbook is wrong
mprintf('\nDifferential fluid height h3 is %.2f m.',new_h3)
