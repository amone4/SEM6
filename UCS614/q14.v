// program for resetting D and T flip flops - async and sync
module DSyncReset(d, q, qbar, clk, reset);
	input d, clk, reset;
	output q, qbar;
	reg q, qbar;

	always @(posedge clk) begin
		if (reset)
			q = 0;
		else
			q = d;
		qbar = ~q;
	end
endmodule

module DASyncReset(d, q, qbar, clk, reset);
	input d, clk, reset;
	output q, qbar;
	reg q, qbar;

	always @(posedge clk or reset) begin
		if (reset)
			q = 0;
		else
			q = d;
		qbar = ~q;
	end
endmodule

module test;
	reg d, clk, reset, i;
	wire q, qbar;
	DASyncReset t(.d(d), .clk(clk), .reset(reset), .q(q), .qbar(qbar));

	initial begin
		clk = 0;
		for (i = 0; i < 16; i++)
			#5 clk = ~clk;
	end

	initial begin
		$dumpfile("q14.vcd");
		$dumpvars(0, test);
		$display("CLK\tD\tRST\tQ\tQbar");
		$monitor("%b\t%b\t%b\t%b\t%b", clk, d, reset, q, qbar);
			reset = 0; #2 d = 0; #2
			reset = 0; #2 d = 1; #2
			reset = 1; #2 d = 0; #2
			reset = 1; #2 d = 1; #2
			reset = 0; #2 d = 0; #2
			reset = 0; #2 d = 1; #2
			reset = 1; #2 d = 0; #2
			reset = 1; #2 d = 1; #2
		$finish;
	end
endmodule