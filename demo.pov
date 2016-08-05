#include "colors.inc" //including some files
#include "textures.inc"
#include "stones.inc"
 plane{
   <0,1,0>,0
   texture {
     pigment { checker
               color White
               color Black }
     scale 8
   }
   
 }
 background { color Cyan }
 camera {
   location <-40, 30, -50>
   look_at  <0, 0,  10>
 }
 sphere {
   <-20,5, 0>, 3
   texture {
     pigment { color Yellow }
   }
 }
 cone {
    <0,5,0>,0
    <0,-5,0>,3
    //<-10, 25, 0>, 0    
    //<-10, 15, 0>, 3    
    texture { T_Stone25 scale 4 }
    rotate <-10,20,360*clock>    
    translate <-10,20,0>
 }
 
 box {
     <0,0,0>,
     <4,4,4>
     pigment{ Red }
     rotate <-10,20,360*clock>
     translate <-20,10,10>
}


torus {
    4, 1
    translate <5,5,5>
    pigment { Blue }
    rotate <-10,20,360*clock>
}


 light_source { <-30, 30, 0> color White}
