module m1(a,b,c,d,e,f,g,h,i);
	input a,b;
	output c,d,e,f,g,h,i;
	and(c,a,b);
	or(d,a,b);
	xor(e,a,b);
	xnor(f,a,b);
	nand(g,a,b);
	not(h,a);
	not(i,b);
endmodule

module test;
	reg a,b;
	wire c,d,e,f,g,h,i;
	m1 t(a,b,c,d,e,f,g,h,i);
	initial begin
		$dumpfile("q1b.vcd");
		$dumpvars(0,test);
		$display("a b AND OR XOR XNOR NAND NOT(a) NOT(b)");
		$monitor("%b %b %b %b %b %b %b %b %b",a,b,c,d,e,f,g,h,i);
		a=0; b=0; #10
		a=0; b=1; #10
		a=1; b=0; #10
		a=1; b=1; #10 $finish;
	end
endmodule