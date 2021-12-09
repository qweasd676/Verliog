module RAM1024x32sing(clk, we, ADDR, Din, Dout);
	parameter DATA_WDTH = 32, ADDR_WDTH = 11;
	input clk;
	input we;	
	input [ADDR_WDTH-1:0] ADDR;
	input [DATA_WDTH-1:0] Din;
	output [DATA_WDTH-1:0] Dout;
	reg [DATA_WDTH-1:0] ram [2047:0];
	reg [ADDR_WDTH-1:0] read_ADDR;
	initial 
	begin
		$readmemh("test.txt",ram);	
		read_ADDR <= ram[0];
	end
	
	always @ (posedge clk)
	begin
		if(we)
		begin
			ram[ADDR] <= Din;
		end
		read_ADDR <= ADDR;
	end
	assign Dout = ram[read_ADDR];
endmodule