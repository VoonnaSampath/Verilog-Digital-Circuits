module priencoder4bit (
input [3:0] i,
output [1:0] y,
output valid );

or o1 (valid,i3,i2,i1,i0); //valid

or o2 (y1,i3,i2); //y1

  
wire i2_nor_i3, temp;
nor (i2_nor_i3, i2, i3);
and (temp, i2_nor_i3, i1);
or (y0, i3, temp); //y1


  //wire i3bar,i2bar; //this block also works
  //not n1 (i3bar,i3);
  //not n2 (i2bar,i2);
  //and (temp,i3bar,i2bar,i1);
  //or o3 (y0, i3,temp);

endmodule