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
    <-10, 25, 0>, 0    
    <-10, 15, 0>, 3    
    texture { T_Stone25 scale 4 }
 }
 light_source { <-30, 30, 0> color White}
