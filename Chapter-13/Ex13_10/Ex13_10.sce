//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
b=5                     //b is width of the open channel in 'm'
P_w=0.6                 //P_w height of the weir in 'm'
W_w=b                   //W_w is width of the weir in 'm'
y1=1.5                  //y1 is depth of water in upstream in 'm'


//Assumption
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
H=y1-P_w                //H is weir height in 'm'
if (H/P_w)<2 then
    C_wd_rec=0.598+((0.0897)*(H/P_w))                   //C_wd_rec is discharge coefficient of the weir
    V_dot_rec=C_wd_rec*(2/3)*b*(H)^(3/2)*sqrt(2*g)      //V_dot_rec is flow rate through the channel in 'm3/s'
    mprintf('\nWater flow rate through the channel is %.2f m3/s.',V_dot_rec)
    //The answers vary due to round off error
else 
   mprintf('\nConditions required to calculate weir discharge co-efficient is not satisfied!!!\nThat is (H/P_w)>2')
end
