module demux(inp,sel,out);
	input inp;
	input [1:0]sel;
	output [3:0]out;
	reg [3:0]out;
	always@(*)begin
		out[0]=0; out[1]=0; out[2]=0; out[3]=0;
		if (sel==2'b00)begin
			out[0]=inp;
		end
		else if (sel==2'b01)begin
			out[1]=inp;
		end
		else if (sel==2'b10)begin
			out[2]=inp;
		end
		else begin
			out[3]=inp;
		end
	end
endmodule

module test;
	reg inp;
	reg [1:0]sel;
	wire [3:0]out;
	demux t(inp,sel,out);
	initial begin
		$dumpfile("q5.vcd");
		$dumpvars(0,test);
		$display("input\tsel1\tsel0\to0\to1\to2\to3");
		$monitor("%b\t\t%b\t\t%b\t\t%b\t%b\t%b\t%b",inp,sel[1],sel[0],out[0],out[1],out[2],out[3]);
		inp=0; sel[0]=0; sel[1]=0; #10
		inp=0; sel[0]=0; sel[1]=1; #10
		inp=0; sel[0]=1; sel[1]=0; #10
		inp=0; sel[0]=1; sel[1]=1; #10
		inp=1; sel[0]=0; sel[1]=0; #10
		inp=1; sel[0]=0; sel[1]=1; #10
		inp=1; sel[0]=1; sel[1]=0; #10
		inp=1; sel[0]=1; sel[1]=1; #10 $finish;
	end
endmodule