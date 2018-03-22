module encoder(inp,out);
	input [3:0]inp;
	output [1:0]out;
	reg [1:0]out;
	always@(*)begin
		out=2'b00;
		case(inp)
			4'b0001:out = 2'b00;
			4'b0010:out = 2'b01;
			4'b0100:out = 2'b10;
			4'b1000:out = 2'b11;
		endcase
	end
endmodule

module test;
	reg [3:0]inp;
	wire [1:0]out;
	encoder t(inp,out);
	initial begin
		$dumpfile("q9.vcd");
		$dumpvars(0,test);
		$display("input\tout");
		$monitor("%b\t%b",inp,out);
		inp=4'b0001; #10
		inp=4'b0010; #10
		inp=4'b0100; #10
		inp=4'b1000; #10 $finish;
	end
endmodule