module testbench();
// Inputs
    reg clk;
    reg we;
    reg [10:0] ADDR = 0;
    reg [31:0] Din ;
	reg [31:0] a;
	reg [10:0] b;
// Outputs
    wire [31:0] Dout ;
	integer i;	
// Instantiate the UUT
    RAM1024x32sing uut (
        .clk(clk), 
        .we(we), 
        .ADDR(ADDR), 
        .Din(Din), 
        .Dout(Dout)
        );
initial
 begin
	clk = 0;
   forever #10 clk=~clk;	//Set clock with a period 20 units
 end
initial	//Initialize input signals
 begin
	#10
	for (i=0; i<20; i=i+1)
		begin
		   we = 1;
           a = $random(); 
           b = $random(); 
		   Din = a;
		   ADDR = b;      
		   #20
		   we  = 0;
		   ADDR= b;
		   #20;
		end
	$finish;
 end
// Initialize Inputs
initial
begin
	$monitor ($time, "Dout =%h, Din=%b, ADDR=%d, we=%b, clk=%b", Dout, Din, ADDR, we, clk);
end
endmodule
