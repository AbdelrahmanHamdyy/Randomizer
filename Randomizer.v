module randomizer(
input wire I,
input wire clk,
input wire reset,
input wire load,
input wire en,
input wire [14:0] seed,
output reg O
);

reg [14:0] Initial; // Shift Register
reg temp; // XOR result

assign Initial = 15'b011011100010101;

always @ (posedge clk) begin
// Reset
if (reset == 1) begin
	Initial <= 0;
end
// Load
if (load == 1) begin
	Initial <= seed;
end
// Enable
if (en == 1) begin
	temp = Initial[0] ^ Initial[1];
	Initial <= Initial >> 1; // shift right
	Initial[14] <= temp; // replace 
	O = temp ^ I; // DataOut
end

end

endmodule
