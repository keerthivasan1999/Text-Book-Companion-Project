clc                         //To clear the console screen
clear                       //To clear all the existing variables in the memory


//Given data
T=40                        //T is water temperature in '°F'
rho=62.24                   //rho is water density in 'lbm/ft3'
Mu=1.038E-3                 //Mu is water viscosity in 'lbm/(ft s)'
D=0.12                      //D is diameter of the pipe in 'in'
L=30                        //L is length of the pipe in 'ft'
V_avg=3                     //V_avg is average velocity of water in the pipe in 'ft/s'


//Unit conversion
D=D/12                      //Conversion from 'in' to 'ft'


//Assumption
g=32.2                      //g is acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
Re=rho*V_avg*D/Mu           //Re is the reynolds number 
if Re<2300 then
    Regime="laminar"
    f=64/Re                //f is the friction factor
else
    if Re>4000
        Regime="turblent"
        f=0.316/(Re^0.25)  //f is the friction factor(Assuming the pipe to be smooth)
    end
end
h_L=f*L*V_avg^2/(2*D*g)    //h_L is head loss in 'ft'


//Display of Result
mprintf('\n(a) Flow Regime is %s.\n    Head loss is %.1f ft.',Regime,h_L)


//Part (b)
//Calculation
Delta_P_L=f*L*rho*V_avg^2/(2*D)      //Delta_P_L is pressure drop in the pipe in 'lbm/(ft s2)'


//Display of Result
mprintf('\n\n(b) Pressure drop is %.1f lbm/(ft s2) or %d lbf/ft2 or %.2f psi.',Delta_P_L,Delta_P_L/32.2,Delta_P_L/(32.2*12^2))
//The answers vary due to round off error


//Part (c)
//Unit conversion
Delta_P_L=Delta_P_L/32.2          //Conversion from 'lbm/(ft s2)' to 'lbf/ft2'


//Calculation
R=D/2                             //R is radius of the pipe in 'ft'
A_c=%pi*R^2                       //A_c is CSA of the pipe in 'ft2'
Q=V_avg*A_c                       //Q is volume flow rate of water in 'ft3/s'
W_pump=Q*Delta_P_L                //W_pump is power required in '(lbf ft)/s'
W_pump=W_pump/0.737               //Conversion from '(lbf ft)/s' to 'W'


//Display of Result
mprintf('\n\n(c) The volume flow rate is %.6f ft3/s.\n    Pumping W_pump Requirement is %.2f W.',Q,W_pump)
