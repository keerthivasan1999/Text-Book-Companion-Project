clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Let 'A','B','1' and '2' be same naming notations as that of FIGURE 8-47 page number 358
//Following is the function to determine 13 unknown using 13 equations and fsolve function where x(1) is Total volume flow rate, x(2) is Volume flow rate in pipe 1, x(3) is Volume flow rate in pipe 2, x(4) is Velocity in pipe 1, x(5) is Velocity in pipe 2, x(6) is Head loss in pipe, x(7) is Head loss in pipe 1, x(8) is Head loss in pipe 2, x(9) is useful pump head, x(10) is Reynolds number in pipe 1, x(11) is Reynolds number in pipe 2, x(12) is Friction factor in pipe 1 and x(13) is Friction factor in pipe 2.
function f=F(x)
    f(1)=(W_elect*Eta_pump_motor)-(g*rho*x(1)*x(9))
    f(2)=x(9)-(Z_B-Z_A)-x(6)
    f(3)=x(6)-x(7)
    f(4)=x(6)-x(8)
    f(5)=x(4)-(x(2)/A_c_1)
    f(6)=x(5)-(x(3)/A_c_2)
    f(7)=x(10)-(rho*D1*x(4)/Mu)
    f(8)=x(11)-(rho*D2*x(5)/Mu)
    f(9)=(1/x(12))-(4*(log10(Epsilon_by_D1+(2.51/(x(10)*sqrt(x(12))))))^2)
    f(10)=(1/x(13))-(4*(log10(Epsilon_by_D2+(2.51/(x(11)*sqrt(x(13))))))^2)
    f(11)=(D1*2*g*x(7))-(L1*x(12)*x(4)^2)
    f(12)=(D2*2*g*x(8))-(L2*x(13)*x(5)^2)
    f(13)=x(1)-x(2)-x(3)
endfunction


//Given data
T=20                    //T is water temperature in '°C'
Z_A=5                   //Z_A is elevation of reservoir 1 in 'm'
Z_B=13                  //Z_B is elevation of reservoir 2 in 'm'
NumberOfPipe=2
L1=36                   //L1 is length of the pipe 1 in 'm'
L2=36                   //L2 is length of the pipe 2 in 'm'
D1=4                    //D1 is diameter of the pipe 1 in 'cm'
D2=8                    //D2 is diameter of the pipe 2 in 'cm'
Eta_pump_motor=70       //Eta_pump_motor is efficiency of motor-pump combination in '%'
W_elect=8               //W_elect is power required by motor-pump combination in 'kW'


//Unit conversion
W_elect=W_elect*1000    //Conversion from 'kW' to 'W'
Eta_pump_motor=Eta_pump_motor/100
D1=D1/100               //Conversion from 'cm' to 'm'
D2=D2/100               //Conversion from 'cm' to 'm'


//Assumption
Epsilon=0.000045        //Epsilon is equivalent roughness value in 'm'
//Water properties at given temperature
rho=998                 //rho is the density of water in 'kg/m3'
Mu=1.002E-3             //Mu is the dynamic viscosity of water in 'kg/(m s)'
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
Epsilon_by_D1=Epsilon/(3.7*D1)//Epsilon_by_D1 is the roughness factor of the pipe 1
Epsilon_by_D2=Epsilon/(3.7*D2)//Epsilon_by_D2 is the roughness factor of the pipe 2
R1=D1/2                 //R1 is radius of the pipe 1 in 'm'
R2=D2/2                 //R2 is radius of the pipe 2 in 'm'
A_c_1=%pi*R1^2          //A_c_1 is CSA of the pipe 1 in 'm2'
A_c_2=%pi*R2^2          //A_c_2 is CSA of the pipe 2 in 'm2'
x0=[0.01 0.001 0.01 5 5 10 10 10 10 100000 200000 0.01 0.01]    //Guess values for the 13 unknown variables
x=fsolve(x0,F)          //fsolve function calling statement


//Display of result
mprintf('\nTotal volume flow rate is %.4f m3/s.\nVolume flow rate in pipe 1 is %.5f m3/s.\nVolume flow rate in pipe 2 is %.4f m3/s.\nVelocity in pipe 1 is %.2f m/s.\nVelocity in pipe 2 is %.2f m/s.\nHead loss in pipe is %.1f m.\nHead loss in pipe 1 is %.1f m.\nHead loss in pipe 2 is %.1f m.\nUseful pump head is %.1f m.\nReynolds number in pipe 1 is %d.\nReynolds number in pipe 2 is %d.\nFriction factor in pipe 1 is %.4f.\nFriction factor in pipe 2 is %.4f.',x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10),x(11),x(12),x(13))
//The answers vary due to round off error
