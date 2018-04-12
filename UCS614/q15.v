// 4-bit counter
module counter(clk, enable, rst, count);
	input enable, clk, rst;
	output [3:0] count;
	reg [3:0] count;

	always @(posedge clk) begin
		if (rst) begin
			count = 4'b0000;
		end
		else if (enable == 1) begin
			count = count + 1;
		end
	end
endmodule

module test;
	reg clk, rst, enable, i;
	wire [3:0] count;
	counter t(.count(count), .clk(clk), .enable(enable), .rst(rst));

	initial begin
		clk = 0;
		for (i = 0; i < 50; i++)
			#1 clk = ~clk;
	end

	initial begin
		$dumpfile("q15.vcd");
		$dumpvars(0, test);
		$display("clk\ten\trst\tcount");
		$monitor("%b\t%b\t%b\t%b", clk, enable, rst, count);
			enable = 1; rst = 1; #5
			enable = 1; rst = 0; #20
			enable = 0; rst = 0; #5
			enable = 1; rst = 0; #15
			enable = 0; rst = 1; #5
		$finish;
	end
endmodule