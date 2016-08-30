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


#if (frame_number>30)
  #declare textura = texture { Green_Glass };
#elseif (frame_number>25)
  #declare textura = texture { Glass };
#elseif (frame_number>20)
  #declare textura = texture { NBwinebottle };
#elseif (frame_number>15)
  #declare textura = texture { Chrome_Metal };
#elseif (frame_number>10)
  #declare textura = texture { NBwinebottle };
#elseif (frame_number>5)
  #declare textura = texture { Glass };
#else
  #declare textura = texture {  Green_Glass };
#end

#if (frame_number>30)
  #declare textura2 = texture { Gold_Metal };
#elseif (frame_number>25)
  #declare textura2 = texture { Silver_Metal };
#elseif (frame_number>20)
  #declare textura2 = texture { Chrome_Metal };
#elseif (frame_number>15)
  #declare textura2 = texture { NBwinebottle };
#elseif (frame_number>10)
  #declare textura2 = texture { Green_Glass };
#elseif (frame_number>5)
  #declare textura2 = texture { Glass2 };
#else
  #declare textura2 = texture { Glass };
#end

/*
#switch (frame_number)
   #case (1)
     #declare textura = texture { Glass };
     #break
   #case (5)
     #declare  textura = texture { Glass };
     #break
   #case (10)
     #declare textura = texture { Glass };
     #break
   #else
     #declare textura = texture { Chrome_Metal };
     #break
 #end
*/
 sphere {
   <-20,5, 0>, 3
   texture {
     textura
   }
   //finish {reflection 0.2}
 }
 cone {
    <0,5,0>,0
    <0,-5,0>,3

    texture { textura }
    rotate <-10,20,360*clock>
    translate <-10,20,0>
    finish { phong 0.9 phong_size 40  // A highlight
             //reflection 0.2  // Glass reflects a bit
           }
 }

 box {
     <-2,-2,-2>,
     <2,2,2>
     texture {textura2}
     rotate <-10,20,360*clock>
     translate <-20,10,10>
}


torus {
    4, 1
    translate <0,0,0>
    texture { textura }
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
  texture { textura }
  rotate y *-30
  translate < 10, 5, 10>
}

#declare nuevo = object{
  merge{
    sphere   { < 0, 15, 0>  2 }
    sphere   { < 0, 13, 0>  1.75 }
    sphere   { < 0, 11, 0>  1.5 }
    sphere   { < 0, 10, 0>  1.25 }
    sphere   { < 0, 9, 0>  1 }
  }
}

object { nuevo
  texture { textura }
  rotate y *-30
  translate < -20, 5, -10>
}
light_source { <-30, 30, 0> color White}
