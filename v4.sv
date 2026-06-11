module v4 (X, Y, V, N, Z); // figure3.47.v (comparator)
	parameter n = 32;
	input [n-1:0] X, Y; 
	output V, N, Z; 
	      [n-1:0] S; 
		  [n:0] C;
	genvar k;

	// always @(X, Y)
	// begin
	// 	C[0] = 1'b1;
	// 	for (k = 0; k < n;  k = k + 1)
	// 	begin
	// 		S[k] = X[k] ^ ~Y[k] ^ C[k];
	// 		C[k+1] = (X[k] & ~Y[k]) | (X[k] & C[k]) | (~Y[k] & C[k]);
	// 	end
	// 	V  = C[n] ^ C[n-1]; 
	// 	N = S[n-1]; 
	// 	Z = !S;
	// end

	generate
		C[0] = 1'b1;
		(for k = 0; k < n; k = k + 1)
		begin
			S[k] = X[k] ^ ~Y[k] ^ C[k];
	 		C[k+1] = (X[k] & ~Y[k]) | (X[k] & C[k]) | (~Y[k] & C[k]);	
		end
		V  = C[n] ^ C[n-1];
		N = S[n-1];
		Z = !S;
	endgenerate
	 
endmodule
