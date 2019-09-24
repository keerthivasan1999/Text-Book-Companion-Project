clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
rho_f=1025              //rho_f is density of sea water in kg/m3
rho_concrete=2300       //rho_concrete is concrete block density in 'kg/m3'
L=0.4                   //L is length of the block in 'm'
B=0.4                   //B is breath of the block in 'm'
W=3                     //W is width of the block in 'm'


//Assumption
g=9.81                  //g is the accleration due to gravity in 'm/s2'


//Part (a)
//Calculation
V=L*B*W                 //V is block volume in 'm3'
W=rho_concrete*g*V      //W is weight of the block in 'N'
W=W/1000                //Conversion from 'N' to 'kN'
F_T_air=W               //F_T_air is the tension in the rope before the block is in water in 'kN'


//Display of result
mprintf('\n(a) Tension in the rope of the crane due to concrete block in air is %.1f kN',F_T_air)


//Part (b)
//Calculation
F_B=rho_f*g*V           //F_B is the upward buoyancy force in 'N'
F_B=F_B/1000            //Conversion from 'N' to 'kN'
F_T_water=W-F_B         //F_T_water is the tension in the rope after the block is in water in 'kN'


//Display of result
printf('\n(b) Tension in the rope of the crane due to concrete block in water is %.1f kN',F_T_water)
