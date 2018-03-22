module decoder(inp,out);
	input [2:0]inp;
	output [7:0]out;
	reg [7:0]out;
	always@(*)begin
		case(inp)
			3'b000:out = 8'b00000001;
			3'b001:out = 8'b00000010;
			3'b010:out = 8'b00000100;
			3'b011:out = 8'b00001000;
			3'b100:out = 8'b00010000;
			3'b101:out = 8'b00100000;
			3'b110:out = 8'b01000000;
			3'b111:out = 8'b10000000;
		endcase
	end
endmodule

module test;
	reg [2:0]inp;
	wire [7:0]out;
	decoder t(inp,out);
	initial begin
		$dumpfile("q8.vcd");
		$dumpvars(0,test);
		$display("input\tout");
		$monitor("%b\t\t%b",inp,out);
		inp=3'b000; #10
		inp=3'b001; #10
		inp=3'b010; #10
		inp=3'b011; #10
		inp=3'b100; #10
		inp=3'b101; #10
		inp=3'b110; #10
		inp=3'b111; #10 $finish;
	end
endmodule