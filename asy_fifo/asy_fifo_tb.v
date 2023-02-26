module asy_fifo_tb;
  wire [7 : 0] data_out;
wire wr_full;
wire rd_empty;
  reg [7: 0] data_in;
reg rd_clk, wr_clk;
reg reset;
  asy_fifo dut(data_out, wr_full, rd_empty, 
				data_in, rd_clk, wr_clk, reset);
initial
  
  begin
    $dumpfile("asy_fifo.vcd");
    $dumpvars(1,asy_fifo_tb);
  end
  always #20 wr_clk=~wr_clk;
  always #100 rd_clk=~rd_clk;
  initial
    begin
      $monitor("time=%t,data_in=%b,data_out=%b",$time,data_in,data_out);
      wr_clk=0;rd_clk=0;reset=1;
      #1data_in=8'b00000000;
      #1reset=0;data_in=8'b00001111;
      #1 data_in=8'b11111111;
      #100000 $finish;
    end
endmodule
