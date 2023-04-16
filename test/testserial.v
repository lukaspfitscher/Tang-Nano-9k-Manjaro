module every_second(
  input clk,
  output reg tx
);

parameter CLK_FREQ = 27000000; // Clock frequency in Hz
parameter BAUD_RATE = 9600; // Baud rate in bps
parameter COUNTER_MAX = (CLK_FREQ / BAUD_RATE); // Counter maximum value for one bit duration

reg [31:0] counter; //32-bit counter for keeping track of clock cycles
reg [ 4:0] c_s;      // 5-bit counter for keeping track of the bit positions
// Add start and stop bits to the uart_code
reg [15:0] uart_code = ~16'b1111011111111111; // Start bit (0), data bits (01011110), stop bit (1)

// Initialize tx to idle state (high)
initial begin
  tx = 1;
end

always @(posedge clk) begin
  // Increment the counter
  counter <= counter + 1;
  // Generate the flag signal when the counter reaches the desired value
  if (counter == COUNTER_MAX) begin
    counter <= 0;
    tx = uart_code[c_s];
    c_s <= c_s + 1;
    if (c_s == 16) begin
        c_s <= 0;
    end
  end
end

endmodule
