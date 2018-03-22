module mux4(inp,sel,out);
	input [3:0]inp;
	input [1:0]sel;
	output out;
	reg out;
	always@(*)begin
		if (sel==2'b00)begin
			out=inp[0];
		end
		else if (sel==2'b01)begin
			out=inp[1];
		end
		else if (sel==2'b10)begin
			out=inp[2];
		end
		else begin
			out=inp[3];
		end
	end
endmodule

module test;
	reg [3:0]inp;
	reg [1:0]sel;
	wire out;
	mux4 t(inp,sel,out);
	initial begin
		$dumpfile("q6.vcd");
		$dumpvars(0,test);
		$display("input1\tinput2\tinput3\tinput4\tsel1\tsel0\tout");
		$monitor("%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b",inp[0],inp[1],inp[2],inp[3],sel[1],sel[0],out);

		sel=2'b00;
		inp=4'b0000; #10
		inp=4'b0001; #10
		inp=4'b0010; #10
		inp=4'b0011; #10
		inp=4'b0100; #10
		inp=4'b0101; #10
		inp=4'b0110; #10
		inp=4'b0111; #10
		inp=4'b1000; #10
		inp=4'b1001; #10
		inp=4'b1010; #10
		inp=4'b1011; #10
		inp=4'b1100; #10
		inp=4'b1101; #10
		inp=4'b1110; #10
		inp=4'b1111; #10

		sel=2'b01;
		inp=4'b0000; #10
		inp=4'b0001; #10
		inp=4'b0010; #10
		inp=4'b0011; #10
		inp=4'b0100; #10
		inp=4'b0101; #10
		inp=4'b0110; #10
		inp=4'b0111; #10
		inp=4'b1000; #10
		inp=4'b1001; #10
		inp=4'b1010; #10
		inp=4'b1011; #10
		inp=4'b1100; #10
		inp=4'b1101; #10
		inp=4'b1110; #10
		inp=4'b1111; #10

		sel=2'b10;
		inp=4'b0000; #10
		inp=4'b0001; #10
		inp=4'b0010; #10
		inp=4'b0011; #10
		inp=4'b0100; #10
		inp=4'b0101; #10
		inp=4'b0110; #10
		inp=4'b0111; #10
		inp=4'b1000; #10
		inp=4'b1001; #10
		inp=4'b1010; #10
		inp=4'b1011; #10
		inp=4'b1100; #10
		inp=4'b1101; #10
		inp=4'b1110; #10
		inp=4'b1111; #10

		sel=2'b11;
		inp=4'b0000; #10
		inp=4'b0001; #10
		inp=4'b0010; #10
		inp=4'b0011; #10
		inp=4'b0100; #10
		inp=4'b0101; #10
		inp=4'b0110; #10
		inp=4'b0111; #10
		inp=4'b1000; #10
		inp=4'b1001; #10
		inp=4'b1010; #10
		inp=4'b1011; #10
		inp=4'b1100; #10
		inp=4'b1101; #10
		inp=4'b1110; #10
		inp=4'b1111; #10 $finish;
	end
endmodule