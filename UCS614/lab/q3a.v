module fulladder(num1,num2,num3,sum,carry);
	input num1, num2, num3;
	output sum, carry;
	assign sum = num1^num2^num3;
	assign carry = (num1&num2)|(num2&num3)|(num1&num3);
endmodule

module test;
	reg a,b,c;
	wire d,e;
	fulladder fa(a,b,c,d,e);
	initial begin
		$dumpfile("q3a.vcd");
		$dumpvars(0,test);
		$display("a b c\td e");
		$monitor("%b %b %b\t%b %b", a,b,c,d,e);
		a=0; b=0; c=0; #10
		a=0; b=0; c=1; #10
		a=0; b=1; c=0; #10
		a=0; b=1; c=1; #10
		a=1; b=0; c=0; #10
		a=1; b=0; c=1; #10
		a=1; b=1; c=0; #10
		a=1; b=1; c=1; #10	$finish;
	end
endmodule