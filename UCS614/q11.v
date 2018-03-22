module JKFlipFlop(jk, q, qbar, clk);
	input [1:0] jk;
	input clk;
	output q, qbar;
	reg q, qbar;

	initial	begin
		q = 0;
		qbar = ~q;
	end

	always @(posedge clk) begin
		case(jk)
			2'b00:	q = q;
			2'b01:	q = 1'b0;
			2'b10:	q = 1'b1;
			2'b11:	q = ~q;
		endcase
		qbar = ~q;
	end
endmodule

module test;
	reg [1:0] jk;
	reg clk, i;
	wire q, qbar;
	JKFlipFlop t(jk,q,qbar,clk);

	initial begin
		clk = 1'b0;
		for (i = 0; i < 8; i++)
			#5 clk = ~clk;
	end

	initial begin
		$dumpfile("q11.vcd");
		$dumpvars(0,test);
		$display("CLK\tS\tR\tQ\tQbar");
		$monitor("%b\t%b\t%b\t%b\t%b", clk, jk[1], jk[0], q, qbar);
		jk = 2'b00; #10
		jk = 2'b01; #10
		jk = 2'b10; #10
		jk = 2'b11; #10 $finish;
	end
endmodule