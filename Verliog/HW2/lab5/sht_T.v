//---------------------------------------------------------
//Shift right or left with 1 bits using concatenate operator
//Filename : sht_l_r.v
//---------------------------------------------------------
module sht_T;
	parameter	size = 16;
	reg  [33:0]	din;
	reg	 [2:0] sel;
	wire [7:0] out1;
	wire [size-1:0]	out;
	wire [31:0]	out2;
	
	sht_r_l	#(8) uut_8 (din, sel, out1);
	sht_r_l	#(	.length(size) ) uut_16 (din, sel, out);
	sht_r_l #(32) uut_32 ( din , sel, out2);

	initial
	begin
		for(sel = 0; sel < 2; sel = sel +1)
			begin
				for(din = 0; din < 2^32; din =din + 1)
					begin	
						#1;
					end	
			end	
		$stop;	
	end	
	
	initial
	begin
		$monitor($time, "din=%b sel=%b out8=%b out16=%b out32=%b ", din, sel, out1, out, out2);
	end


	endmodule
