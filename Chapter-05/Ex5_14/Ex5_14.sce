clc                             //To clear the console screen
clear                           //To clear all the existing Variables in the memory


//Let '1', '2', '3' and '4' be the same naming notations as shown in FIGURE 5-56 page number 212
//Given data
L=12                            //L is length of the computer case in 'cm'
B=40                            //B is breath of the computer case in 'cm'
W=40                            //W is width of the computer case in 'cm'
D=5                             //D is diameter of hole available to install fan in 'cm'
rho=1.20                        //rho is the air density in 'kg/m3'
Eta_fan_motor=0.30              //Eta_fan_motor is efficiency of fan motor
Void_Fraction=0.5               //Void_Fraction is the void fraction of the case
t1=0                            //t1 is the initail time in 's'
t2=1                            //t2 is initial time in 's'


//Unit Conversion
L=L/100                         //Conversion from 'cm' to 'm'
B=B/100                         //Conversion from 'cm' to 'm'
W=W/100                         //Conversion from 'cm' to 'm'
D=D/100                         //Conversion from 'cm' to 'm'


//Assumption
P1=101325                       //P1 is pressure at the inlet section in 'Pa'
P2=101325                       //P2 is pressure at the outlet section in 'Pa'
Z1=0                            //Z1 is height of the inlet section in 'm'
Z2=0                            //Z2 is height of the outlet section in 'm'
V1=0                            //V1 is velocity at the inlet section in 'm/s'
alpha1=1.1                      //Assuming the flow to be turblent
alpha2=1.1                      //Assuming the flow to be turblent
W_turbine=0                     //W_turbine is mechanical work output of turbine in 'W'
Z3=0                            //Z3 is height of point 3 in 'm'
Z4=0                            //Z4 is height of point 4 in 'm'
g=9.81                          //g is acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
R=D/2                           //R is radius of the case in 'm'
Total_case_volume=L*B*W         //Total_case_volume is volume of case in 'm3'
V=Void_Fraction*Total_case_volume//V is air volume in the case in 'm3'
Q=V/(t2-t1)                     //Q is volume flow rate of air through the case in 'm3/s'
m=rho*Q                         //m is mass flow rate of air through the case in 'kg/s'
A=%pi*R^2                       //A is the CSA of the case in 'm2'
V2=Q/A                          //V2 is velocity at the outlet section in 'm/s'
W_fan_u=(m*((P2/rho)+(alpha2*V2^2/2)+(g*Z2)))-(m*((P1/rho)+(alpha1*V1^2/2)+(g*Z1)))+W_turbine//W
W_elect=W_fan_u/Eta_fan_motor   //W_elect is required electric power input to the fan in 'W'


//Display of result
mprintf('\n(a) Electric power input to the fan is %.3f W.',W_elect)
//The answers vary due to round off error


//Part (b)
//Calculation
PressureDrop=rho*W_fan_u/m      //PressureDrop is pressure rise across the fan in 'Pa'


//Display of result
mprintf('\n(b) Pressure difference across the fan is %.1f Pa.',PressureDrop)
