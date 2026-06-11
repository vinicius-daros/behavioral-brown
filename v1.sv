module v1 (W, S, f); //mux8to2
  input [7:0] W;
  input [1:0] S;
  output reg [1:0] f;

  // always @(W, S) 
  //   case (S)
  //     0: f = W[1:0];
  //     1: f = W[3:2];
  //     2: f = W[5:4];
  //     3: f = W[7:6];
  //   endcase

  // assign f = (S == 0) ? W[1:0] :
  //            (S == 1) ? W[3:2] :
  //            (S == 2) ? W[5:4] : W[7:6];

  assign f = S[1] ? (S[0] ? W[7:6] : W[5:4]) : (S[0] ? W[3:2] : W[1:0]);
endmodule