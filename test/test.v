module top (
	input clk,
	output [4:1] led
);

reg [31:0] counter = 0;

always @(posedge clk) begin
  if (counter == 50000000) begin
    led <= ~led;
    counter <= 0; 
  end else begin
    counter <= counter + 1;
  end
end

endmodule
