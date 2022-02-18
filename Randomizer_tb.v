module randomizer_tb();

reg [95:0] I; // Input Data
reg [95:0] O; // Randomized Data
reg clk, reset, load, en;
reg [14:0] seed;
reg DataIn;
wire DataOut;

reg [95:0] Expected; // Correct Output to be compared with

integer i;

assign O = 0;
assign Expected = 96'h558AC4A53A1724E163AC2BF9;

initial begin
I = 96'hACBCD2114DAE1577C6DBF4C9;
reset = 0;
load = 0;
seed = 0;
en = 1;
clk = 1;
for (i = 95; i >= 0; i = i - 1) begin
	DataIn = I[i];
	#5 clk = ~clk;
	#5 clk = ~clk;
	O[i] = DataOut;
end
if (O == Expected) begin
	$display("Success!");
	#10 $finish;
end
else begin
	$display("Failure!");
	#10 $finish;
end

end

randomizer rand (DataIn, clk, reset, load, en, seed, DataOut);

endmodule
