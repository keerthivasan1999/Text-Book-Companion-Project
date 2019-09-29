clc                         //To clear the console screen
clear                       //To clear all the existing variables in the memory


//Following function is used to determination of friction factor from colebrook equation using fsolve function
function f=F(f0)
    f=(1/f0)-(4*(log10((Epsilon_by_D/3.7)+(2.51/(Re*sqrt(f0)))))^2)
endfunction


//Given data
T=60                        //T is water temperature in '°F'
rho=62.36                   //rho is the water density in 'lbm/ft3'
Mu=7.536E-4                 //Mu is the water viscosity in 'lbm/(ft s)'
D=2                         //D is diameter of the pipe in 'in'
Q=0.2                       //Q is volume flow rate of water in 'ft3/s'
L=200                       //L is length of the pipe in 'ft'


//Unit conversion
D=D/12                      //Conversion from 'in' to 'ft'


//Assumption
Epsilon=0.000007            //Epsilon is equivalent roughness value in 'ft'(Obtained from TABLE 8-2)
g=32.2                      //g is acceleration due to gravity in 'ft/s2'


//Calculation
R=D/2                       //R is radius of the pipe in 'ft'
A_c=%pi*R^2                 //A_c is CSA of the pipe in 'ft2'
V=Q/A_c                     //V is velocity of water in 'ft/s'
Re=rho*V*D/Mu               //Re is dimensionless reynolds Mumber
if Re<2300 then
    Regime="laminar"
    f=64/Re                 //f is the friction factor
else
    if Re>4000
        Regime="turblent"
        Epsilon_by_D=Epsilon/D  //Epsilon_by_D is the roughness factor of the pipe
        f0=0.01                 //f0 is the guess friction factor used to to determine actual friction factor using fsolve function
        f=fsolve(f0,F)          //Determination of actual friction factor using fsolve function
    end
end
Delta_P=f*L*rho*V^2/(2*D)      //Delta_P is pressure drop in the pipe in '(lbm ft)/s2'
Delta_P=Delta_P/g              //Conversion from 'lbm/(ft s2)' to 'lbf/ft2'
h_L=Delta_P/rho                //h_L is head loss in 'ft'
W_pump=Q*Delta_P               //W_pump is the required power input in '(lbf ft)/s'
W_pump=W_pump/0.737            //Conversion from '(lbf ft)/s' to 'W'


//Display of result
mprintf('\nFlow regime is %s.\nFriction factor is %.4f.\nPressure drop is %d lbf/ft2 or %.1f psi.\nHead loss is %.1f ft.\nRequired power input is %d W.',Regime,f,Delta_P,Delta_P/12^2,h_L,W_pump)
//The answers vary due to round off error
