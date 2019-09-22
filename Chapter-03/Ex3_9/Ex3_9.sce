clc                                     //To clear the console screen
clear                                   //To clear all the existing variables in the memory


//Given data
R=0.8                                   //R is radius of long solid cylinder in 'm'
s=4.2                                   //m
h_bottom=5                              //h_bottom is water level in 'm'


//Assumption
rho=1000                                //rho is density of water in 'kg/m3'
L=1                                     //L is length of cylinder in 'm'


//Part (a)
//Calculation
A=R*L                                   //Area is area of cylinder in 'm2'
F_H=rho*9.81*(s+(R/2))*A/1000           //F_H is horizontal force on vertical surface in 'kN'
F_y=rho*9.81*h_bottom*A/1000            //F_y is vertical force on horizontal surface in 'kN'
W=rho*9.81*((R^2)-(%pi*R^2/4))*L/1000   //W is weight of fluid block in 'kN'
//Division by 1000 on above three equation is to convert 'N' to 'kN'
F_V=F_y-W                               //F_V is net upward vertical force in 'kN'
F_R=sqrt((F_H^2)+(F_V^2))               //F_R is magnitude of the hydrostatic force in 'kN'
theta=atan(F_V/F_H)                     //theta is direction of the hydrostatic force in 'radian'
theta=theta*180/%pi                     //Conversion of angle from 'radian' to '°(degree)'


//Display of result
mprintf('\n\n(a) Hydrostatic force acting on the cylinder is %.1f kN.\n    Direction of the force is %.1f°.',F_R,theta)


//Part (b)
//Calculation 
theta=theta*%pi/180                     //Conversion of angle from '°(degree)' to 'radian'
W_cyl=F_R*sin(theta)                    //W_cyl is weight of the cylinder per lenght in 'kN'


//Display of result
mprintf('\n\n(b) The weight of the cylinder per m lenght is %.1f kN.',W_cyl)
