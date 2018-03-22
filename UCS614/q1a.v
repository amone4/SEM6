module logic_gates(a,b,c,d,e,f,g,h);
	input a,b;
	output c,d,e,f,g,h;
	assign c=a&b;
	assign d=a|b;
	assign e=a~&b;
	assign f=a~|b;
	assign g=a^b;
	assign h=~a;
endmodule

module test;
	reg a,b;
	wire c,d,e,f,g,h;
	logic_gates t(a,b,c,d,e,f,g,h);
	initial begin
		$dumpfile("q1a.vcd");
		$dumpvars(0,test);
		$monitor("a=%b,b=%b,and=%b,or=%b,nand=%b,nor=%b,xor=%b,not=%b",a,b,c,d,e,f,g,h);
		a=0; b=0; #10
		a=1; b=0; #10
		a=0; b=1; #10
		a=1; b=1; #10 $finish;
	end
endmodule