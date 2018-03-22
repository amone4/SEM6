module hs(a,b,dif,bor);
	input a,b;
	output dif,bor;
	assign dif=a&(~b)|b&(~a);
	assign bor=(~a)&b;
endmodule

module test;
	reg a,b;
	wire dif,bor;
	hs t(a,b,dif,bor);
	initial begin
		$dumpfile("q2b.vcd");
		$dumpvars(0,test);
		$display("a\tb\tdif\tbor");
		$monitor("%b\t%b\t%b\t%b",a,b,dif,bor);
		a=0; b=0; #10
		a=0; b=1; #10
		a=1; b=0; #10
		a=1; b=1; #10 $finish;
	end
endmodule