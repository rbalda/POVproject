#include "colors.inc" //including some files
#include "textures.inc"
#include "stones.inc"
 plane{
   <0,1,0>,2
   texture {
     pigment { checker
               color White
               color Black
              }
     scale 5
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
   //finish {reflection 0.2}
 }
 cone {
    <0,5,0>,0
    <0,-5,0>,3

    texture { T_Stone25 scale 4 }
    rotate <-10,20,360*clock>
    translate <-10,20,0>
    finish { phong 0.9 phong_size 40  // A highlight
             //reflection 0.2  // Glass reflects a bit
           }
 }

 box {
     <-2,-2,-2>,
     <2,2,2>
     pigment{ Red }
     rotate <-10,20,360*clock>
     translate <-20,10,10>
}


torus {
    4, 1
    translate <0,0,0>
    pigment { Blue }
    rotate <90,0,0>
    rotate <0,360*clock,0>
    translate <5,5,5>
}

#declare objeto1 = object{
  merge{
    cone     { < 0, 13.9, 0>  2.8
               < 0, 18.0, 0>  0.8 }
    sphere   { < 0, 12.4, 0>  3.2 }
  }
}

object { objeto1
  texture {  Cherry_Wood }
  rotate y *-30
  translate < 10, 5, 10>
}

 light_source { <-30, 30, 0> color White}
