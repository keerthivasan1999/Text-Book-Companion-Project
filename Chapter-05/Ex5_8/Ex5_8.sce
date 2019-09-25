clc             //To clear the console screen
clear           //To clear all the existing variables in the memory


//Let '1' and '2' denotes the point under the piezometer and tip point of the pitot tube as shown in FIGURE 5-41.
//Given data
h1=3            //cm
h2=7            //cm
h3=12           //cm


//Unit conversion
h1=h1/100       //Conversion from 'cm' to 'm'
h2=h2/100       //Conversion from 'cm' to 'm'
h3=h3/100       //Conversion from 'cm' to 'm'


//Assumption
Z1=0                    //m
Z2=0                    //m
rho=1000                //rho is density of water in 'kg/m3'
V2=0                    //V2 is velocity at the tip of the pitot tube in 'm/s'
g=9.81                  //g is the acceleration due to gravity in 'm/s2'


//Calculation
P1=rho*g*(h1+h2)         //P1 is pressure at the centre of the pipe in 'Pa'
P2=rho*g*(h1+h2+h3)      //P2 is pressure at the tip of the pitot tube in 'Pa'
V1=sqrt(2*g*(((P2-P1)/(rho*g))+(V2^2/(2*g))+(Z2-Z1)))//V1 is velocity at the centre of the pipe in 'm/s'


//Display of result
mprintf('Velocity at the centre of the pipe is %.2f m/s.',V1)
