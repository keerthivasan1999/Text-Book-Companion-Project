//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Let '1' and '2' be the same numbering notations as that of FIGURE 13-20 in page number 696
//Given data
S0=0.003                //S0 is bottom slope of the channel
n1=0.030                //n1 is manning coefficient in section 1
n2=0.050                //n2 is manning coefficient in section 2
Height_1=2              //Height_1 is height of section 1 in 'm'
Width_1=6               //Width_1 is width of the section 1 in 'm'
Slope_Height_1=3        //Slope_Height_1 is slope length of section 1 in 'm'
Height_2=2              //Height_2 is height of the section 2 in 'm'
Width_2=8               //Width_2 is width of the section 2 in 'm'


//Assumption
a=1                     //a is a factor with uint 'm^(1/3)/s'


//Calculation
Slope_Length_1=sqrt(Slope_Height_1^2+(Width_1/2)^2)     //Slope_Height_2 is slope length of section 2 in 'm'
A_c_1=(Height_1*Width_1)+(0.5*Slope_Height_1*Width_1)   //A_c_1 is section 1 flow area in 'm2'
p1=Height_1+(2*Slope_Length_1)                          //p1 is perimeter of section 1 in 'm'
R_h_1=A_c_1/p1                                          //R_h_1 is hydraulic radius of section 1 in 'm'
A_c_2=Height_2*Width_2                                  //A_c_2 is section 2 flow area in 'm2'
p2=Width_2+Height_2                                     //p2 is perimeter of section 2 in 'm'
R_h_2=A_c_2/p2                                          //R_h_2 is hydraulic radius of section 2 in 'm'
A_c=A_c_1+A_c_2                                         //A_c is flow area of entire channel in 'm2'
p=p1+p2                                                 //p is perimeter of the entire channel in 'm'
R_h=(A_c_1+A_c_2)/(p1+p2)                               //R_h is hydraulic radius of the entire section in 'm'
Q=((A_c_1*R_h_1^(2/3)/n1)+(A_c_2*R_h_2^(2/3)/n2))*S0^(1/2)*a//Q is volume flow rate through the channel in 'm3/s'
n_eff=a*A_c*(R_h)^(2/3)*(S0)^(1/2)/Q                        //n_eff is manning coefficient for the entire channel


//Display of result
mprintf('\nVolume flow rate through the channel is %d m3/s.\nThe effective manning co-efficient is %.3f.',Q,n_eff)
//The answers vary due to round off error
