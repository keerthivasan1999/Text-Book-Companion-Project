clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Let '1' and '2' be the same numbering notation as shown FIGURE 8-48 page number 360
//Following function is used to determination of friction factor from colebrook equation using fsolve function
function f=F(f0)
    f=(1/f0)-(4*(log10((Epsilon_by_D/3.7)+(2.51/(Re*sqrt(f0)))))^2)
endfunction


//Given data
T=10                    //T is water temperature in '°C'
D=5                     //D is diameter of cast iron piping system in 'cm'
Q=6                     //Q is volume flow rate of water in 'L/s'
K_L_entrance=0.5        //K_L_entrance is loss coefficient of entrance
K_L_elbow=0.3           //K_L_elbow is loss coefficient of elbow
K_L_valve=0.2           //K_L_valve is loss coefficient of valve 
K_L_exit=1.06           //K_L_exit is loss coefficient of exit
Z2=4                    //Z2 is elevation of reservoir 2 in 'm'
Distance=9              //m
Length=80               //m


//Unit conversion
Q=Q/1000                //Conversion from 'L/s' to 'm3/s'
D=D/100                 //Conversion from 'cm' to 'm'


//Assumption
Epsilon=0.00026         //Epsilon is equivalent roughness value in 'm'
P1=101325               //P1 is pressure in reservoir 1 in 'Pa'
P2=101325               //P2 is pressure in reservoir 2 in 'Pa'
V1=0                    //V1 is water velocity in reservoir 1 in 'm/s'
V2=0                    //V2 is water velocity in reservoir 2 in 'm/s'
g=9.81                  //g is acceleration due to gravity in 'm/s2'
Alpha1=1.03             //Alpha1 is the kinetic energy correction factor(Assuming flow to be turblent)
Alpha2=1.03             //Alpha2 is the kinetic energy correction factor(Assuming flow to be turblent)
//Water properties at the given temperature
rho=999.7               //rho is water density in 'kg/m3'
Mu=1.307E-3             //Mu is dynamic viscosity of water in 'kg/(m' s)


//Calculation
L=Distance+Length       //L is total length of the pipe in 'm'
R=D/2                   //R is radius of the pipe in 'm'
A=%pi*R^2               //A is area of the pipe in 'm2'
V=Q/A                   //V is velocity of water in the pipe in 'm/s'
Re=rho*V*D/Mu           //Re is the reynolds number in the pipe
if Re<2300 then
    Regime="laminar"
    f=64/Re             //f is the friction factor of the pipe 
else
    if Re>4000
        Regime="turblent"
        Epsilon_by_D=Epsilon/D  //Epsilon_by_D is the roughness factor of the pipe 
        f0=0.01                 //f0 is the guess friction factor used to to determine actual friction factor using fsolve function
        f=fsolve(f0,F)          //Determination of actual friction factor using fsolve function
    end
end
Sigma_K_L=K_L_entrance+(2*K_L_elbow)+K_L_valve+K_L_exit     //Sigma_K_L is the total loss co-efficient
h_L=((f*L/D)+(Sigma_K_L))*V^2/(2*g)                         //h_L is the total head loss in 'm'
Z1=(P2/(rho*g))-(P1/(rho*g))+(Alpha2*V2^2/(2*g))-(Alpha1*V1^2/(2*g))+Z2+h_L//Z2 is the elevation of the source in 'm'


//Display of result
mprintf('\nFlow Regime is %s.\nFriction factor is %.4f.\nTotal head loss is %.1f m.\nElevation Z1 is %.1f m.',Regime,f,h_L,Z1)
//The answers vary due to round off error
