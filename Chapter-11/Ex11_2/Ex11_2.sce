//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
V=95                        //V is average speed of the car in 'km/h'
L=24000                     //L is total distance per year in 'km/year'
rho_fuel=0.8                //rho_fuel is density of the gasoline in 'kg/L'
GasolinePrice=0.6           //GasolinePrice is price of gasoline in '$/L'
HV=44000                    //HV is the heating value of gasoline in 'kJ/kg'
Eta_car=30                  //Eta_car is overall efficiency of the engine in '%'
D=13                        //D is diameter of the miror in 'cm'


//Unit conversion
Eta_car=Eta_car/100
V=V*1000/3600                   //Conversion from 'km/h' to 'm/s'
D=D/100                         //Conversion from 'cm' to 'm'
rho_fuel=rho_fuel*1000          //Conversion from 'kg/L' to 'kg/m3'
GasolinePrice=GasolinePrice*1000//Conversion from '$/L' to '$/m3'


//Assumption
CD_flat=1.1                 //CD_flat is the dicharge coefficient for circular disk
CD_hemisp=0.4               //CD_hemisp is the dicharge coefficient for hemishperical body
rho=1.2                     //rho is air density in 'kg/m3'


//Calculation
R=D/2                       //R is radius of the mirror in 'm'
A=%pi*R^2                   //A is area of the mirror in 'm2'
F_D=CD_flat*A*rho*V^2/2     //F_D is drag force acting on the flat mirror in 'N'
W_drag=F_D*L                //W_drag is the amount of work done in 'kJ'/year
E_in=W_drag/Eta_car         //E_in is the required energy input in 'kJ/year'
Amount_of_fuel=E_in/(HV*rho_fuel)                   //Amount_of_fuel is required amount of fuel in 'L/year'
Cost=Amount_of_fuel*GasolinePrice                   //'Cost' is cost of required fuel in '$/year'
Reduction_Ratio=(CD_flat-CD_hemisp)/CD_flat
Fuel_reduction=Reduction_Ratio*Amount_of_fuel       //Fuel_reduction is the reduction in fuel consumption in 'm3/year'
Fuel_reduction=Fuel_reduction*1000                  //Conversion from 'm3/year' to 'L/year'
Cost_Reduction=Reduction_Ratio*Cost                 //Cost_Reduction is reduction of cost in '$/year'


//Lplay of result
mprintf('\nAmount_of_fuel of money saved is %.2f $/year.\nAmount_of_fuel of fuel saved is %.2f L/year.',Cost_Reduction,Fuel_reduction)
//The answers vary due to round off error
