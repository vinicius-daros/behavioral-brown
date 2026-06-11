module top (
  input [31:0] random_bits,
  output mux4to1_out,
  output [1:0] mux8to2_out,
  output [1:0] priority_encoder_Y_out,
  output priority_encoder_Z_out,
  output [7:0] addern_S_out,
	output addern_carryout_out, addern_overflow_out,
  output comparator_V_out, comparator_N_out, comparator_Z_out,
  output [0:3] dec2to4_Y_out,
  output compareAeqB, compareAgtB, compareAltB,
  output [3:0] shifter_Y_out,
  output shifter_k_out);

  v0 mux4to1_ (
    .W(random_bits[3:0]),
    .S(random_bits[5:4]),
    .f(mux4to1_out)
  );

  v1 mux8to2_ (
    .W(random_bits[7:0]),
    .S(random_bits[9:8]),
    .f(mux8to2_out)
  );
  
  v2 pe_ (
    .W(random_bits[11:8]),
    .Y(priority_encoder_Y_out),
    .Z(priority_encoder_Z_out)
  );

  v3 #(8) adder_ (
    .carryin(random_bits[16]),
    .X(random_bits[ 7:0]),
    .Y(random_bits[15:8]),
    .S(addern_S_out),
    .carryout(addern_carryout_out),
    .overflow(addern_overflow_out)
  );

v4 #(3) comp_ (
  .X(random_bits[19:17]),
  .Y(random_bits[22:20]),
  .V(comparator_V_out),
  .N(comparator_N_out),
  .Z(comparator_Z_out)
  );

v5 dec2to4_ (
  .En(random_bits[24]),
  .W(random_bits[26:25]),
  .Y(dec2to4_Y_out)
);

v6 cmp_ (
  .A(random_bits[3:0]),
  .B(random_bits[17:14]),
  .AeqB(compareAeqB),
  .AgtB(compareAgtB),
  .AltB(compareAltB)
);

v7 shifter_ (
  .W(random_bits[31:28]),
  .Shift(random_bits[16]),
  .Y(shifter_Y_out),
  .k(shifter_k_out)
);

endmodule