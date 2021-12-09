module T();

 // Inputs
 reg clk;
 reg reset;
 reg [7:0] a1;
 reg [7:0] a2;
 reg [7:0] a3;
 reg [7:0] b1;
 reg [7:0] b2;
 reg [7:0] b3;
 

 // Outputs
 wire [16:0] c1;
 wire [16:0] c2;
 wire [16:0] c3;
 wire [16:0] c4;
 wire [16:0] c5;
 wire [16:0] c6;
 wire [16:0] c7;
 wire [16:0] c8;
 wire [16:0] c9;
 integer	i;

 // Instantiate the Unit Under Test (UUT)
multiplication uut(
  .clk(clk), 
  .reset(reset), 
  .a1(a1), 
  .a2(a2), 
  .a3(a3), 
  .b1(b1), 
  .b2(b2), 
  .b3(b3), 
  .c1(c1), 
  .c2(c2), 
  .c3(c3), 
  .c4(c4), 
  .c5(c5), 
  .c6(c6), 
  .c7(c7), 
  .c8(c8), 
  .c9(c9)
 );

 initial begin
  // Initialize Inputs
  clk = 0;
  reset = 0;
  a1 = 0;
  a2 = 0;
  a3 = 0;
  b1 = 0;
  b2 = 0;
  b3 = 0;

  // Wait 100 ns for global reset to finish
  #10 reset = 1;
  #10 reset = 0;
  
  for (i=0; i<20; i=i+1)
		begin
			a1=$random();
			a2=$random(); 
			a3=$random(); 
			b1=$random();
			b2=$random();
			b3=$random();
			#10; 
        end 

  #100;
  $stop;

 end
 
initial begin
  forever #10 clk = ~clk;
 end
initial
begin
	$monitor ($time, "clk=%b, a1 =%d, a2 =%d, a3 =%d, b1 =%d, b2 =%d, b3 =%d, c1 =%d, c2 =%d, c3 =%d, c4 =%d, c5 =%d, c6 =%d, c7 =%d, c8 =%d, c9 =%d",clk, a1, a2, a3, b1, b2, b3, c1, c2, c3, c4, c5, c6, c7, c8, c9);
end     
endmodule