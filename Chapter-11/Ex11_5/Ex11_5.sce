//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
m=70000                     //m is mass of the airplane in 'kg'
A=150                       //A is wing planform area in 'm2'
V=558                       //V is speed of plane in 'km/h'
Altitude=12000              //m
rho=0.312                   //rho is air density at cruising altitude in 'kg/m3'


//Unit conversion
V=V*1000/3600               //Conversion from 'km/h' to 'm/s'


//Assumption
rho_ground=1.20             //rho_ground is air density on the ground in 'kg/m3'
C_L1=1.52                   //C_L1 is maximum lift co-efficient of the wing without flaps
C_L2=3.48                   //C_L2 is maximum lift co-efficient of the wing with flaps
g=9.81                      //g is acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
W=m*g                                   //W is weight of the airplane in 'N'
V_min_1=sqrt(2*W/(rho_ground*C_L1*A))   //V_min_1 is minimum velocity without flaps in 'm/s'
V_min_2=sqrt(2*W/(rho_ground*C_L2*A))   //V_min_2 is minimum velocity with flaps in 'm/s'
V_min_1_safe=1.2*V_min_1                //V_min_1_safe is safe minimum velocity without flaps in 'm/s'
V_min_2_safe=1.2*V_min_2                //V_min_2_safe is safe minimum velocity with flaps in 'm/s'


//Display of result
mprintf('\n(a) Safe minimum velocities are %d km/h and %d km/h.\n',V_min_1_safe*3600/1000,V_min_2_safe*3600/1000)


//Part (b)
//Calculation
F_L=W                       //F_L is lift force in 'N'
C_L=F_L/(0.5*rho*V^2*A)     //C_L is the lift co-efficient
mprintf('\n(b) Lift co-efficient is %.2f.',C_L)
Alpha=10                    //Alpha is the angle of attack(in °(degree)) corresponding to the 'C_L' value is determined from FIGURE 11-45. When input variables are changed, 'C_L' changes. So, Change the attack angle accordingly using FIGURE 11-45 page number 591.


//Display of result
mprintf('\n    The angle of attack is %d°.\n',Alpha)


//Part (c)
C_D=0.03                //The drag coefficient corresponding to the 'C_L' is determined from FIGURE 11-45 page number 591. When input variables are changed, 'C_L' changes. So, Change the 'C_D' accordingly using FIGURE 11-45.
F_D=C_D*A*rho*V^2/2     //F_D is drag force acting on the wings in  'N'
F_D=F_D/1000            //Conversion from 'N' to 'kN'
Power=F_D*V             //'Power' is the power required to overcome the drag in 'kW'


//Display of result
mprintf('\n(c) Drag force acting on the wings is %.1f kN.\n    Power required to overcome this drag is %d kW.',F_D,Power)
//The answers vary due to round off error
