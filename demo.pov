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



 #if (frame_number>45)
   camera {
     location <-14, 4, -20>
     look_at  <0, 0,  10>
   }
  #elseif (frame_number>20)
    camera {
      location <-40+(frame_number-19), 30-(frame_number-19), -50+(frame_number-19)>
      look_at  <0, 0,  10>
    }
  #else
   camera {
     location <-40, 30, -50>
     look_at  <0, 0,  10>
   }
#end

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

#if (frame_number>25)
  #declare textura2 = texture { Gold_Metal };
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
    translate <0,-10,-10>
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
  translate < -20, 5, -30>
}

#declare esferaAzul=sphere {
  <0, 1, 0> // centro de la esfera
  0.5       // radio de la esfera
  scale <2,2,2> // <= Note: Spheres can become ellipses by uneven scaling
  translate <0,-2,0>
  texture {
    pigment{color rgb<1, 1, 5>}
    finish {diffuse 0.9 phong 1 reflection 0.00}
  }
}
#declare cuboAmarillo=box {
  <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
  texture {
    pigment{color rgb <3, 2, 0>}
    finish {diffuse 0.9 phong 1 reflection 0}
  }
  scale <1,1,1> rotate<0,0,0> translate<0,-1,0>
}

#declare nuevoInter =intersection {
  object {
    esferaAzul
    scale <1.2,1.2,1.2>
  }
  object {
    cuboAmarillo
  }
}

object {nuevoInter
    translate<5,5,0>
}

#macro snowman(height)

  union {
    // snowman bottom
    sphere {
      <0, 1, 0> // center of sphere <X Y Z>
      1       // radius of sphere
      texture {
            pigment { color White }
      }
      scale height*y
    }

    // snowman middle
    sphere {
      <0, 2.3, 0> // center of sphere <X Y Z>
      .7       // radius of sphere
      texture {
            pigment { color White }
      }
      scale height*y
    }

    // snowman head
    sphere {
      <0, 3.2, 0> // center of sphere <X Y Z>
      .5       // radius of sphere
      texture {
            pigment { color White }
      }
      scale height*y
    }

    // snowman arms
    cylinder {
      <1.6, 2.3, 0>,<-1.6, 2.3, 0>
      .1
       texture {
            pigment { color Brown }
      }
      translate -2.3*(1-height)*y
    }

    // snowman eye 1
    sphere {
      <.2, 3.25, -.5> // center of sphere <X Y Z>
      .1       // radius of sphere
      texture {
            pigment { color Black }
      }
      translate -3.25*(1-height)*y
    }
      // snowman eye 2
    sphere {
      <-.2, 3.25, -.5> // center of sphere <X Y Z>
      .1       // radius of sphere
      texture {
            pigment { color Black }
      }
      translate -3.25*(1-height)*y
    }

    // snowman nose
    cone {
      <0, 3.15, -.5>,  .1,
      <0, 3.25, -.7>, 0.0
      texture {
            pigment { color Orange }
      }
      translate -3.15*(1-height)*y
    }

    // hat top
    cylinder {
      <0, 3.6, 0> ,  <0, 4.2, 0> ,  .3
      texture {
            pigment { color Green }
      }
      translate -3.6*(1-height)*y
    }
    //hat rim
    cylinder {
      <0, 3.6, 0> ,  <0, 3.61, 0> ,  .6
      texture {
            pigment { color Green }
      }
      translate -3.6*(1-height)*y
    }
  }
#end // end of macro

#if ((frame_number>5&frame_number<10)|(frame_number>15&frame_number<20)|(frame_number>25&frame_number<30)|(frame_number>35&frame_number<40)|(frame_number>45&frame_number<50)|(frame_number>55&frame_number<60))
  object {
     snowman(1-0.1+.001)
     translate <0,2,0>
  }
#else
  object {
     snowman(1+0.1+.001)
     translate <0,2,0>
  }
#end

light_source { <-30, 30, 0> color White}
