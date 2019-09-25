clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//'1' deontes the gas tank, '2' denotes the gas can and '3' denotes the peak of tube as shown in FIGURE 5-20 page number 196 
//Given data
rho=750             //rho is the density of gasoline in 'kg/m3'
D=4                 //D is diameter of the siphon in 'mm'
V=4                 //V is volume of gasoline to be withdrawn in 'L'


//Assumption
P1=101.3            //kPa
P2=101.3            //kPa
Z2=0                //m
Z1=0.75             //m
Z3=2.75             //m
V1=0                //m/s
g=9.81              //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
P1=P1*1000          //Conversion from 'kPa' to 'Pa'
P2=P2*1000          //Conversion from 'kPa' to 'Pa'
D=D/1000            //Conversion from 'mm' to 'm'
V=V/1000            //Comversion from 'L' to 'm3'


//Part (a)
//Calculation
R=D/2               //R is the radius of siphon in 'm'
A=%pi*R^2           //A is the area of siphon in 'm2'
V2=sqrt(2*g*(((P1-P2)/(rho*g))+(V1^2/(2*g))+Z1-Z2))//m/s
Q=V2*A              //Q is the volume flow rate of gasoline in 'm3/s'
Delta_t=V/Q         //Delta_t is the time needed to siphoning in 's'
V=V*1000            //Conversion from 'L' to 'm3'


//Display of result
mprintf('\n(a) Velocity at the gas can is %.2f m/s.\n    Cross sectional A of the tube is %f m2.\n    V flow rate at the gas can is %f m3/s.\n    Delta_t needed to siphon %d L is %.1f s.',V2,A,Q,V,Delta_t)
//The answer provided in the textbook is wrong


//Part (b)
//Calculation
V3=V2               //m/s
P3=rho*g*((P2/(rho*g))+((V2^2-V3^2)/(2*g))+(Z2-Z3))//Pa
P3=P3/1000          //Conversion from 'Pa' to 'kPa'


//Display of result
mprintf('\n\n(b) Pressure at the position 3 is %.1f kPa.',P3)
