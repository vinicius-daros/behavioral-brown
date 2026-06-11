module v7 (W, Shift, Y , k); //figure4.54.v (shifter)
	input [3:0] W;
	input Shift;
	output reg [3:0] Y;
	output reg k;
	
	always @(W, Shift)
	begin
		if (Shift)
		begin
			Y = W >> 1;
			k = W[0];
		end
		else
		begin
			Y = W;
			k = 0;
		end
	end

endmodule

