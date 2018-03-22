module SRFlipFlop(sr, q, qbar, clk);
	input [1:0] sr;
	input clk;
	output q, qbar;
	reg q, qbar;

	initial	begin
		q = 0;
		qbar = ~q;
	end

	always @(posedge clk) begin
		case(sr)
			2'b00:	q = q;
			2'b01:	q = 1'b0;
			2'b10:	q = 1'b1;
			2'b11:	q = 1'bz; // z implies high impedance state
		endcase
		qbar = ~q;
	end
endmodule

module test;
	reg [1:0] sr;
	reg clk, i;
	wire q, qbar;
	SRFlipFlop t(sr,q,qbar,clk);

	initial begin
		clk = 1'b0;
		for (i = 0; i < 8; i++)
			#5 clk = ~clk;
	end

	initial begin
		$dumpfile("q10.vcd");
		$dumpvars(0,test);
		$display("CLK\tS\tR\tQ\tQbar");
		$monitor("%b\t%b\t%b\t%b\t%b", clk, sr[1], sr[0], q, qbar);
		sr = 2'b00; #10
		sr = 2'b01; #10
		sr = 2'b10; #10
		sr = 2'b11; #10 $finish;
	end
endmodule