module halfadder(num1,num2,sum,carry);
	input num1, num2;
	output sum, carry;
	assign sum = num1^num2;
	assign carry = num1&num2;
endmodule

module test;
	reg a,b;
	wire c,d;
	halfadder ha(a,b,c,d);
	initial begin
		$dumpfile("q2a.vcd");
		$dumpvars(0,test);
		$display("a b c d");
		$monitor("%b %b %b %b", a,b,c,d);
		a=0; b=0; #10
		a=0; b=1; #10
		a=1; b=0; #10
		a=1; b=1; #10 $finish;
	end
endmodule