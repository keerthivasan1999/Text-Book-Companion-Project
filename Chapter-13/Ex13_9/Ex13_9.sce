//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
delta_z_b=15                //delta_z_b is height of bumb in 'cm'
y1=0.80                     //y1 is flow depth in 'm'
v1=1.2                      //v1 is water velocity before the bump in 'm/s'


//Unit conversion
delta_z_b=delta_z_b/100     //Conversion from 'cm' to 'm'


//Assumption
g=9.81                      //g is acceleration due to gravity in 'm/s2'


//Calculation
Fr1=v1/sqrt(g*y1)           //Fr1 is upstream Froude number
y_c=(y1^2*v1^2/g)^(1/3)     //y_c is upstream critical depth in 'm'
E_s1=y1+(v1^2/(2*g))        //E_s1 is upstream specific energy in 'm'
if Fr1<1 then
    flow="Subcritical"
    Possible_y2=roots([1,-(E_s1-delta_z_b),0,(v1^2*y1^2/(2*g))])
    for i=1:3//This loop is to eliminate negative depth and depth which is less than the critical depth
            if real(Possible_y2(i))>0 then
                if real(Possible_y2(i))>y_c then
                    y2=real(Possible_y2(i))         //y2 is flow depth over the bump in 'm'
                end
            end
    end
    Height_Over_Bump=delta_z_b+y2                   //Height_Over_Bump is flow depth after the bump in 'm'
    if Height_Over_Bump<y1 then
        condition="depressed"
        Depression=y1-Height_Over_Bump              //Depression is difference of flow depth before the bump and over the bump in 'm'
        mprintf('\nFlow is %s.\nWater surface if %s over the bump in the amount of %.2f m.',flow,condition,Depression)
    else 
        condition="elevated"
        Elevation=Height_Over_Bump-y1               //Elevation is difference of flow depth over the bump and before the bump in 'm'
        mprintf('\nFlow is %s.\nWater surface if %s over the bump in the amount of %.2f m.',flow,condition,Elevation)
    end
else
    flow="supercritical"
    Possible_y2=roots([1,-(E_s1-delta_z_b),0,(v1^2*y1^2/(2*g))])
    for i=1:3//This loop is to eliminate negative depth and depth which is less than the critical depth
            if real(Possible_y2(i))>0 then
                if real(Possible_y2(i))<y_c then
                    y2=real(Possible_y2(i))         //y2 is flow depth over the bump in 'm'
                end
            end
    end
    Height_Over_Bump=delta_z_b+y2                   //Height_Over_Bump is flow depth after the bump in 'm'
    if Height_Over_Bump<y1 then
        condition="depressed"
        Depression=y1-Height_Over_Bump              //Depression is difference of flow depth before the bump and over the bump in 'm'
        mprintf('\nFlow is %s.\nWater surface if %s over the bump in the amount of %.2f m.',flow,condition,Depression)
    else 
        condition="elevated"
        Elevation=Height_Over_Bump-y1               //Elevation is difference of flow depth over the bump and before the bump in 'm'
        mprintf('\nFlow is %s.\nWater surface if %s over the bump in the amount of %.2f m.',flow,condition,Elevation)
    end
end
