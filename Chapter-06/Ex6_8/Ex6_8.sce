clc                         //To clear the console screen
clear                       //To clear all the existing Variables in the memory


//Let '1' and '2' be the same naming notations as shown in FIGURE 6-37 page number 255
//Given data
D=10                        //D is the diameter of the pipe in 'cm'
V2=3                        //V2 is velocity of water in 'm/s'
Mass=12                     //Mass is the mass of the horizontal pipe section when filled with water in 'kg/m'
r1=0.5                      //m
r2=2                        //m


//Unit conversion
D=D/100                     //Conversion from 'cm' to 'm'


//Assumption
g=9.81                      //g is acceleration due to gravity in 'm/s2'
rho=1000                    //rho is water density in 'kg/m3'


//Calculation
R=D/2                       //R is the radius of the pipe in 'm'
A_c=%pi*R^2                 //A_c is the CSA of the pipe in 'm2'
m=rho*V2*A_c                //m is mass flow rate of water in 'kg/s'
W=Mass*(2*r1)*g             //W is the weight of the horizontal section of the pipe in 'N'
M_A=(r1*W)-(r2*m*V2)        //M_A is the angular momentum about the point A in 'Nm'
L=sqrt((2*r2*m*V2)/W)       //L is length of the horizontal pipe that will cause the moment vanish in 'm'


//Display of result
mprintf('\nAngular M_A around the point A is %.1f N m.\nHorizontal section L required to make the M_A at A zero is %.2f m.',M_A,L)
//The answer provided in the textbook is wrong
