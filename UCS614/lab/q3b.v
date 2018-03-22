module fullsubtractor(num1,num2,num3,diff,borrow);
	input num1, num2, num3;
	output diff, borrow;
	wire r1, r2, r3, r4, r5;
	assign r1 = ~num1;
	assign r2 = ~num2;
	assign r3 = ~num3;
	assign diff = (r1&r2&num3)|(r1&num2&r3)|(num1&r2&r3)|(num1&num2&num3);
	assign borrow = (r1&num3)|(r1&num2)|(num2&num3);
endmodule

module test;
	reg a,b,c;
	wire d,e;
	fullsubtractor fs(a,b,c,d,e);
	initial begin
		$dumpfile("q3b.vcd");
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