module d_ff_negedge(input d,clk,output reg q);
  always@(negedge clk)
    q<=d;
endmodule
