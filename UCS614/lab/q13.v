module TFlipFlop(t, q, qbar, clk);
	input t, clk;
	output q, qbar;
	reg q, qbar;

	initial	begin
		q = 0;
		qbar = ~q;
	end

	always @(posedge clk) begin
		case(t)
			1'b0:	q = q;
			1'b1:	q = ~q;
		endcase
		qbar = ~q;
	end
endmodule

module test;
	reg t, clk, i;
	wire q, qbar;
	TFlipFlop tff(t,q,qbar,clk);

	initial begin
		clk = 1'b0;
		for (i = 0; i < 8; i++)
			#5 clk = ~clk;
	end

	initial begin
		$dumpfile("q13.vcd");
		$dumpvars(0,test);
		$display("CLK\tT\tQ\tQbar");
		$monitor("%b\t%b\t%b\t%b", clk, t, q, qbar);
		t = 1'b0; #10
		t = 1'b1; #10
 		t = 1'b0; #10
		t = 1'b1; #10 $finish;
	end
endmodule