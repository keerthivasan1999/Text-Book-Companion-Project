//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                    //To clear the console screen
clear;                                  //To clear all the existing variables in the memory
clf(0)                                  //Clear or reset or reset a figure 0
clf(1)                                  //Clear or reset or reset a figure 1


//Given data
D_A=6                                   //D_A is impeller diameter of pump A in 'cm'
n_A=1725                                //n_A is the rotational speed of pump A in 'rpm'
Omega_A=180.6                           //Omega_A is angular velocity of pump A in 'rad/s'
V_dot_A=[100 200 300 400 500 600 700]   //V_dot_A is the volume flow rate obtained from TABLE 14-2 in 'cm3/s'
H_A=[180 185 175 170 150 95 54]         //H_A is the head obtained from TABLE 14-2 in 'cm'
Eta_pump_A=[32 54 70 79 81 66 38]       //Eta_pump_A is the pump efficiency obtained from TABLE 12-2 in '%'
V_dot_B=2400                            //V_dot_B is the volume flow rate in pump B in 'cm3/s'
H_B=450                                 //H_B is the net head of pump B in 'cm'


//Unit conversion 
V_dot_B=V_dot_B*10^-6                   //Conversion from 'cm3/s' to 'm3/s'
H_B=H_B/100                             //Conversion from 'cm' to 'm'


//Assumption
g=9.81              //g is acceleration due to gravity in 'm/s2'
rho_water=998       //rho_water is the water density in 'kg/m3'
rho_R134a=1226      //rho_R134a is the density of the refrigerant in 'kg/m3'


//Calculation
m=length(V_dot_A)   //m is number of data in 'V_dot_A' matrix found using 'length' function
for i=1:m
    bhp_A(i)=rho_water*g*V_dot_A(i)*H_A(i)/((Eta_pump_A(i)/100)*100^4)//W
    //Division by '10^4' on the R.H.S of the above equation is convert the 'V_dot_A' and 'H_A' into 'meter3/s' and 'meter' respectively.
end
scf(0)
plot(V_dot_A,H_A,'r',V_dot_A,Eta_pump_A,'k.-',V_dot_A',bhp_A.*20','-.r')
xlabel("V_dot,cm3/s")
legend(['H,cm';'Eta,%';'bhp*20,W'],-1)
title("FIGURE 14-76: Dimensional upmp performance curves for the water pump of Example 14-11")
for i=1:m
    C_H_A(i)=g*(H_A(i)/100)/(Omega_A^2*(D_A/100)^2)
    C_Q_A(i)=V_dot_A(i)/(Omega_A*D_A^3)
    C_P_A(i)=bhp_A(i)/(rho_water*Omega_A^3*(D_A/100)^5)
end
scf(1)
//Following 'for' loop is to find the maximum value present in the 'Eta_pump_A' matrix to determine the 'BEP'
Eta_max=Eta_pump_A(1)
m=length(Eta_pump_A)
for i=2:m
    if Eta_pump_A(i)>Eta_max then
        Eta_max=Eta_pump_A(i)//Eta_max is maximum value in the Eta_pump_A matrix
    end 
end
Eta_max=Eta_max/100     //Conversion from '%(percentage)' to 'fraction'
plot(C_Q_A'.*100,Eta_pump_A./100,'k',C_Q_A.*100,C_P_A.*100,'-.r',C_Q_A.*100,C_H_A.*10,'r')
xlabel("C_Q_A*100")  
legend(['Eta_pump_A*100';'C_P_A*100';'C_H_A*10'],1)
title("FIGURE 14-77: Non dimensional pump performance curves for the pumps of Example 14-11; BEP is estimated as the operating point where Eta_pump_A is a maximum")
Eta_pump_star=Eta_max   //Maxima of the efficiency curve
//Following dimensionless pump parameters are obtained from FIGURE 14_77 corresponding to the maximum efficiency.
C_Q_star=0.0112         //point of intersection of the vertical line from the maxima of efficiency curve and C_V_dot curve
C_H_star=0.133          //point of intersection of the vertical line from the maxima of efficiency curve and C_H curve
C_P_star=0.00184        //point of intersection of the vertical line from the maxima of efficiency curve and C_P curve



//Display of result
mprintf('\n(a) Dimension less pump parameters are as follows:\n    C_Q_star=%.4f\n    C_H_star=%.3f\n    C_P_star=%.5f\n    Eta_pump_star=%.3f',C_Q_star,C_H_star,C_P_star,Eta_pump_star)
//The answers vary due to round off error


//Part (b)
//Calculation
D_B=((V_dot_B^2*C_H_star)/(C_Q_star^2*g*H_B))^(1/4) //D_B is the diameter of the pump B in 'm'
Omega_B=V_dot_B/(C_Q_star*D_B^3)                    //Omega_B is the angular velocity in pump B in 'rad/s'
n_B=Omega_B*60/(2*%pi)                              //n_B is the rotational speed in pump B in 'rpm'
bhp_B=C_P_star*rho_R134a*Omega_B^3*D_B^5            //bhp_B is the required brake horse power of pump B in 'W'


//Display of result
mprintf('\n\n(b) Diameter of the pump B is %.3f m\n    Rotational speed in pump B is %d rpm\n    Required brake horse power of pump B is %d W',D_B,n_B,bhp_B)
//The answers vary due to round off error
