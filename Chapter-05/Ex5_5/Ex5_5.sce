clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Given data
P1=400              //P1 is pressure water flowing from water hose in 'kPa gage'


//Assumption
rho=1000            //rho is water density in 'kg/m3'
V1=0                //V1 is velocity inside the hose in 'm/s'
V2=0                //V2 is velocity at the top of the water trajectory in 'm/s'
Z1=0                //Z1 is the height of the hose outlet in 'm'
P2=101325           //P2 is pressure at the top of the water trajectory in 'Pa'
g=9.81              //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
P1=P1*1000          //Conversion from 'kPa gage' to 'Pa gage'
P1=P1+101325        //Conversion from 'Pa gage' to 'Pa absolute'


//Calculation
Z2=((P1-P2)/(rho*g))+((V1^2-V2^2)/(2*g))+Z1//Z2 is the maximum height that the jet could acheive in 'm'


//Display of result
mprintf('Maximum height that the jet could achieve is %.1f m.',Z2)
