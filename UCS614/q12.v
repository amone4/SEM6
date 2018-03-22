module DFlipFlop(d, q, qbar, clk);
	input d, clk;
	output q, qbar;
	reg q, qbar;

	initial	begin
		q = 0;
		qbar = ~q;
	end

	always @(posedge clk) begin
		case(d)
			1'b0:	q = 1'b0;
			1'b1:	q = 1'b1;
		endcase
		qbar = ~q;
	end
endmodule

module test;
	reg d, clk, i;
	wire q, qbar;
	DFlipFlop t(d,q,qbar,clk);

	initial begin
		clk = 1'b0;
		for (i = 0; i < 8; i++) begin
			#5 clk = ~clk;
		end
	end

	initial begin
		$dumpfile("q12.vcd");
		$dumpvars(0,test);
		$display("CLK\tD\tQ\tQbar");
		$monitor("%b\t%b\t%b\t%b", clk, d, q, qbar);
		d = 1'b0; #10
		d = 1'b1; #10
 		d = 1'b0; #10
		d = 1'b1; #10 $finish;
	end
endmodule