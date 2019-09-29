clc                             //To clear the console screen
clear                           //To clear all the existing variables in the memory


//Given data
rho=888                         //rho is density of the oil in 'kg/m3'
Mu=0.8                          //Mu is viscosity of the oil in 'kg/(m s)'
D=5                             //D is diameter of the pipe in 'cm'
L=40                            //L is length of the pipe in 'm'
P1=745                          //P1 is pressure at the pipe inlet in 'kPa'
P2=97                           //P2 is presure at the pipe outlet in 'kPa'
theta1=0                        //theta1 is angle that pipe makes with horizontal in '°(degree)'
theta2=15                       //theta2 is angle that pipe makes with horizontal in '°(degree)'
theta3=-15                      //theta3 is angle that pipe makes with horizontal in '°(degree)'


//Unit conversion
P1=P1*1000                      //Conversion from 'kPa' to 'Pa'
P2=P2*1000                      //Conversion from 'kPa' to 'Pa'
D=D/100                         //Conversion from 'cm' to 'm'
theta1=theta1*%pi/180           //Conversion from 'degree' to 'radian'
theta2=theta2*%pi/180           //Conversion from 'degree' to 'radian'
theta3=theta3*%pi/180           //Conversion from 'degree' to 'radian'


//Assumption
g=9.81                          //g is acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
Delta_P=P1-P2                   //Delta_P i pressure drop across the pipe in 'Pa'
R=D/2                           //R is radius of the pipe in 'm'
A_c=%pi*R^2                     //A_c is CSA of the pipe in 'm2'
Q1=(Delta_P-(rho*g*L*sin(theta1)))*%pi*D^4/(128*Mu*L)//Q1 is volume flow rate of water in 'm3/s'
V1=Q1/A_c                       //V1 is the average fluid velocity in 'm/s'
Re1=rho*V1*D/Mu                 //Re1 is reynolds number in the pipe
  
  
//Display of result
mprintf('\n(a) The flow rate of oil through the pipe is %.5f m3/s.',Q1)
if(Re1<2300)
    mprintf('\n    Flow is laminar.')
else
    if Re1>4000
        mprintf('\n    Flow is turblent.')
    end
end


//Part (b)
//Calculation
Q2=(Delta_P-(rho*g*L*sin(theta2)))*%pi*D^4/(128*Mu*L)//Q2 is volume flow rate of water in 'm3/s'
V2=Q2/A_c                       //V2 is the average fluid velocity in 'm/s'
Re2=rho*V2*D/Mu                 //Re2 is reynolds number in the pipe


//Display of result
mprintf('\n\n(b) The flow rate of oil through the pipe is %.5f m3/s.',Q2)
if(Re2<2300)
    mprintf('\n    Flow is laminar.')
else
    if Re2>4000
        mprintf('\n    Flow is turblent.')
    end
end


//Part (c)
//Calculation
Q3=(Delta_P-(rho*g*L*sin(theta3)))*%pi*D^4/(128*Mu*L)//Q2 is volume flow rate of water in 'm3/s'
V3=Q3/A_c                       //V3 is the average fluid velocity in 'm/s'
Re3=rho*V3*D/Mu                 //Re3 is reynolds number in the pipe
  
  
//Display of result
mprintf('\n\n(c) The flow rate of oil through the pipe is %.5f m3/s.',Q3)
if(Re3<2300)
    mprintf('\n    Flow is laminar.')
else
    if Re3>4000
        mprintf('\n    Flow is turblent.')
    end
end
