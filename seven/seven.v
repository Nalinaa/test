module seven(d,clk,enable,q);
 wire zero;
  input d,clk,enable;
  output reg q;
  reg mux_o;
  assign zero=q;
  initial
    begin
      case(enable)
        0:mux_o=zero;
        1:mux_o=d;
      endcase
    end
    always@(posedge clk)
      q<=mux_o;
endmodule
      
      
