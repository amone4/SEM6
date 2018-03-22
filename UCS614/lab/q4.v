module mux(inp1,inp2,sel,out);
	input inp1,inp2,sel;
	output out;
	assign out=sel?inp2:inp1;
endmodule

module test;
	reg a,b,c;
	wire o;
	mux t(.sel(a),.inp1(b),.inp2(c),.out(o));
	initial begin
		$dumpfile("q4.vcd");
		$dumpvars(0,test);
		$display("select\tinput1\tinput2\toutput");
		$monitor("%b\t\t%b\t\t%b\t\t%b",a,b,c,o);
		a=0; b=0; c=0; #10
		a=0; b=0; c=1; #10
		a=0; b=1; c=0; #10
		a=0; b=1; c=1; #10
		a=1; b=0; c=0; #10
		a=1; b=0; c=1; #10
		a=1; b=1; c=0; #10
		a=1; b=1; c=1; #10 $finish;
	end
endmodule