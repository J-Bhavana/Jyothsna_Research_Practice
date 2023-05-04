`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 17:49:27
// Design Name: 
// Module Name: KMeans
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:56:38 01/10/2020 
// Design Name: 
// Module Name:    Kmeans 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Kmeans(clk,reset,start,y,tr1
    );
input clk,reset,start;
output [17:0] y;
output tr1;
parameter wea = 1'b0,ena = 1'b0,ada = 3'b000,ina = 18'b000000000000000000; // writing is not considered
wire [17:0] x1,x2,y1,y2,ip,in,inx,iny;
wire tc1,tc2;
wire [2:0] adb,adb2,adb3,ada3,indexes,adb5,adb6,adb7,out4,lmt1,lmt2,lmt3;
wire [1:0] ada2,adb4,adb1,out,indx,ada4,it;
parameter zro = 18'b000000000000000000;

//////////starting pulse generation........
pg pg2(start,start1,enp,clk,reset);
count3 cntg2(,3'b000,start1,enp,clk,reset,start1,3'b110);
/////////starting pulse generation.........

//////////Storage of data vectors........
dpm1 m1(clk,ena,wea,ada,ina,enb,adb,x1);
dpm2 m2(clk,ena,wea,ada,ina,enb,adb,y1);
assign enb = enb11|enp2|mode;
mux3 mx2(adb7,adb6,mode,adb);
mux3 mx1(adb3,indexes,enb11,adb7);
/////////memory for intial or new centroids....
dpm3 m3(clk,ena4,ena4,ada4,inx,enp2,adb4,x2);
dpm4 m4(clk,ena5,ena5,ada4,iny,enp2,adb4,y2);
mux16 mx4(y,x1,ena2,inx);
mux16 mx5(y,y1,ena2,iny);
assign ena4 = ena2 | (tr1 & mde & ~mde1);
assign ena5 = ena2 | (tr1 & mde1);
mux2 mx3(ada3[1:0],ada2,ena2,ada4);
/////Storage of initaal indices.....
dpm5 m5(clk,1'b0,1'b0,2'b00,3'b000,enb1,adb1,indexes);

////reading the indexes....
pg p1(start1,tc1,enb1,clk,reset);
count2 cnt1(adb1,2'b00,tc1,enb1,clk,reset,tc1,2'b01);


DFF df2(enb11,clk,reset,enb1);
//DFF df3(enb12,clk,reset,enb11);

//DFF df1(tc11,clk,reset,tc1);
pg p2(tc1,tc2,ena2,clk,reset);
count2 cnt2(ada2,2'b00,tc2,ena2,clk,reset,tc2,2'b01);

/////writing new centriods.....
loadcnt_up3 cnt6(ada3,3'b000,tc6|ldc,tr1&mde,clk,reset,tc6,3'b011);
tff tf6(ldc|(tc6&mde1),clk,reset,mde);
tff tf7(tc6|(tc6&mde),clk,reset,mde1);
//////Reading data from ram 3 and 4
assign start_rd = tc2 | it_end1;
pg p3((tc32|start_rd)&~tc41,tc3,enp2,clk,reset);
count2 cnt4(adb4,2'b00,start_rd|tc3|tc31,enp2,clk,reset,tc3,2'b01);
DFF df11(tc31,clk,reset,tc3);
DFF df12(tc32,clk,reset,tc31);
DFF df22(tc41,clk,reset,tc4);
//////Reading data from ram 1 and 2
count3 cnt5(adb3,3'b000,start_rd|(tc3&tc4),tc3,clk,reset,tc4,3'b111);
////////////EDC//////////////
EDC m6(clk,reset,x1,x2,y1,y2,ip);

//mux16 mx(zro,ip,1'b1,in);
sort sb(ip,clk,start_rd,reset,indx,indxc,start_avg);

///////Indexes...............
reg3_delay rgr(adb5,clk,reset,adb);
dmux3_1 dmz(indxc,indx,indxc1,indxc2,indxc3);

clusters cltr(clk,reset,start_rd,start_avg,indxc1,indxc2,indxc3,it_end,adb5,mode,mode1,adb6,lmt1,lmt2,lmt3);

average_block avg(x1,y1,clk,reset,start_avg,mode1,y,tr1,ldc,lmt1,lmt2,lmt3);
/////lmt1,lmt2,lmt3----are denoting the size of the clusters.........
/////y is the average values..new value of the seeds........seen to be along with tr1 signal......

////iteration count............ 
count2 cnt12(it,2'b00,tc22,it_end,clk,reset,tc22,2'b11);
assign it_end = tc6 & mde1;
DFF df16(it_end1,clk,reset,it_end);
endmodule

module EDC(clk,reset,x1,x2,y1,y2,ip
    );
input clk,reset;
input [17:0] x1,x2,y1,y2;
output [17:0] ip;
wire [17:0] t1,t2,t3,t4,t5,t6,t7,t8;
adsub ad1(1'b1,x1,x2,t1);
adsub ad2(1'b1,y1,y2,t2);

reg16 f1(t3,clk,reset,t1);
reg16 f2(t4,clk,reset,t2);

mult m1(t3, t3, t5);
mult m2(t4, t4, t6);

reg16 f3(t7,clk,reset,t5);
reg16 f4(t8,clk,reset,t6);

adsub ad3(1'b0,t7,t8,ip);

endmodule

module DFF(q,clk,reset,d);
    input d,clk,reset;
    output reg q;
//initial begin q=0; end
always @ (posedge (clk)) begin
 if (reset)
  q <= 0;
 else  
 q<= d ;
end
endmodule

module adsub (sel,c,a,p);
  input sel;
  input [17:0] a,c;
  output [17:0] p;
 assign p = (sel)?(c-a):(c+a);
endmodule

module reg16(y,clk,reset,a);
    input [17:0] a;
    output [17:0] y;
    input clk,reset;
 
DFF d1(y[0],clk,reset,a[0]);
DFF d2(y[1],clk,reset,a[1]);
DFF d3(y[2],clk,reset,a[2]);
DFF d4(y[3],clk,reset,a[3]);
DFF d5(y[4],clk,reset,a[4]);
DFF d6(y[5],clk,reset,a[5]);
DFF d7(y[6],clk,reset,a[6]);
DFF d8(y[7],clk,reset,a[7]);
DFF d9(y[8],clk,reset,a[8]);
DFF d10(y[9],clk,reset,a[9]);
DFF d11(y[10],clk,reset,a[10]);
DFF d12(y[11],clk,reset,a[11]);
DFF d13(y[12],clk,reset,a[12]);
DFF d14(y[13],clk,reset,a[13]);
DFF d15(y[14],clk,reset,a[14]);
DFF d16(y[15],clk,reset,a[15]);
DFF d17(y[16],clk,reset,a[16]);
DFF d18(y[17],clk,reset,a[17]);
endmodule

module mux16(A,B,S,Y);

    input [17:0] A,B;
    output [17:0] Y;
    input S;
assign Y = (S)? B : A;
endmodule

module mux3(A,B,S,Y);

    input [2:0] A,B;
    output [2:0] Y;
    input S;
assign Y = (S)? B : A;
endmodule

module mux2(A,B,S,Y);

    input [1:0] A,B;
    output [1:0] Y;
    input S;
assign Y = (S)? B : A;
endmodule

module fdc2(a,clk,en,reset,y);
	 input [1:0] a;
	 input clk,reset,en;
	 output [1:0] y;
fdce1 d1(y[0],clk,en,reset,a[0]);
fdce1 d2(y[1],clk,en,reset,a[1]);
endmodule

module fdce1(q,clk,ce,reset,d);
    input d,clk,ce,reset;
    output reg q;
//initial begin q=0; end
always @ (posedge (clk)) begin
if (reset)
  q <= 1'b0;
 else if (ce)
  q <= d;
 else 
 q<= q ;
end
endmodule

module mult (a, b, p);
  input signed [17:0] a,b;
  output [17:0] p;
  wire [31:0] p1;
  assign p1 = a*b;
  assign p = p1[27:10];
endmodule

module Mux(a,b,s,y);
    input  a,b,s;
    output y;
wire sbar;
assign y = (a&sbar)|(s&b);
assign sbar = ~s;
endmodule

module pg(start,tc,q,clk,reset);
	 input start,tc,clk,reset;
	 output  q;
	 
	 wire t1,t2;
	 parameter vdd=1'b1;
	 parameter gnd=1'b0;
    Mux M1(t2,vdd,start,q);
	 Mux M2(q,gnd,tc,t1);
	 DFF d2(t2,clk,reset,t1);
//    assign  s1 = (start|tc);
endmodule

module tff(t,clk,reset,q);
input t,clk,reset;
output reg q;
//initial begin q=1'b0; end
always@(posedge clk)
if(reset)
q<=0;
else if(t) 
q<=~q;
else q<=q;
endmodule


module count3(out,data,load,en,clk,reset,tc,lmt);
output [2:0] out;
output reg tc;
input [2:0] data,lmt;
input load, en, clk,reset;
reg [2:0] out;
always @(posedge clk)
if (reset) begin
  out <= 3'b000 ;
end else if (load) begin
  out <= data;
end else if (en)
  out <= out + 3'b001;
else out <= out;
always @(posedge clk)
if (out ==lmt)
tc=1;
else tc=0;
endmodule

module count2(out,data,load,en,clk,reset,tc,lmt);
output [1:0] out;
output reg tc;
input [1:0] data,lmt;
input load, en, clk,reset;
reg [1:0] out;
always @(posedge clk)
if (reset) begin
  out <= 2'b00 ;
end else if (load) begin
  out <= data;
end else if (en)
  out <= out + 2'b01;
else out <= out;
always @(posedge clk)
if (out ==lmt)
tc=1;
else tc=0;
endmodule

module loadcnt_up3(q,b,s,en,clk,reset,tc,lmt);
	 input clk,reset,s,en;
wire [2:0] d;
input [2:0] b,lmt;
wire a1,a2,a3,a4,a5,a6,t1,t2,t3,t4,t5,en1;
output wire [2:0] q;
output tc;
//parameter reset =1'b0;
assign d[0] = ~q[0];
assign d[1] = q[1] ^ q[0];
assign d[2] = q[2] ^  ( q[1] & q[0]);

Mux m1(d[0],b[0],s,t1);
DFF1 d1(q[0],clk,reset,t1,en1);
Mux m2(d[1],b[1],s,t2);
DFF1 d2(q[1],clk,reset,t2,en1);
Mux m3(d[2],b[2],s,t3);
DFF1 d3(q[2],clk,reset,t3,en1);
assign en1 = s | en;
assign a1 = q[0] ~^ lmt[0];
assign a2 = q[1] ~^ lmt[1];
assign a3 = q[2] ~^ lmt[2];
assign tc = a1 & a2 & a3;
endmodule

module DFF1(q,clk,reset,d,en);
    input d,clk,reset,en;
    output reg q;
//initial begin q=0; end
always @ (posedge (clk)) begin
 if (reset)
  q <= 0;
 else if(en) 
 q<= d ;
 else q <=q;
end
endmodule

module fdce18(a,clk,en,rst,y);
	 input [17:0] a;
	 input clk,en,rst;
	 output [17:0] y;
fdce1 d1(y[0],clk,en,rst,a[0]);
fdce1 d2(y[1],clk,en,rst,a[1]);
fdce1 d3(y[2],clk,en,rst,a[2]);
fdce1 d4(y[3],clk,en,rst,a[3]);
fdce1 d5(y[4],clk,en,rst,a[4]);
fdce1 d6(y[5],clk,en,rst,a[5]);
fdce1 d7(y[6],clk,en,rst,a[6]);
fdce1 d8(y[7],clk,en,rst,a[7]);
fdce1 d9(y[8],clk,en,rst,a[8]);
fdce1 d10(y[9],clk,en,rst,a[9]);
fdce1 d11(y[10],clk,en,rst,a[10]);
fdce1 d12(y[11],clk,en,rst,a[11]);
fdce1 d13(y[12],clk,en,rst,a[12]);
fdce1 d14(y[13],clk,en,rst,a[13]);
fdce1 d15(y[14],clk,en,rst,a[14]);
fdce1 d16(y[15],clk,en,rst,a[15]);
fdce1 d17(y[16],clk,en,rst,a[16]);
fdce1 d18(y[17],clk,en,rst,a[17]);
endmodule

module dpm1(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[2:0] ada,adb;
input[17:0] ina;
output reg [17:0] outb;
reg [17:0] outa;
reg [17:0] mem [0:7];
initial begin $readmemh("x_elements.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module dpm2(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[2:0] ada,adb;
input[17:0] ina;
output reg [17:0] outb;
reg [17:0] outa;
reg [17:0] mem [0:7];
initial begin $readmemh("y_elements.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module dpm3(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[1:0] ada,adb;
input[17:0] ina;
output reg [17:0] outb;
reg [17:0] outa;
reg [17:0] mem [0:3];
//initial begin $readmemh("initial_x_values.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module dpm4(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[1:0] ada,adb;
input[17:0] ina;
output reg [17:0] outb;
reg [17:0] outa;
reg [17:0] mem [0:3];
//initial begin $readmemh("initial_y_values.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module dpm5(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[1:0] ada,adb;
input[2:0] ina;
output reg [2:0] outb;
reg [2:0] outa;
reg [2:0] mem [0:3];
initial begin $readmemh("indexes.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module average_block(x,y,clk,reset,start,mode,z,tr1,trig,lmt1,lmt2,lmt3
    );
input [17:0] x,y;
output [17:0] z;
input [2:0] lmt1,lmt2,lmt3;
output tr1,trig;
//input [2:0] d;
input clk,reset,start,mode;
wire [17:0] b1,b,a,d1,b2;
wire [2:0] out,out1,d2,d3,lmt,s;
DFF f1(start1,clk,reset,start);
DFF f3(start2,clk,reset,start1);

lsh10 sf(lmt,d1);
mux16 mx(x,y,mode,a);
adsub ad(1'b0,a,b1,b);
reg16 f2(b1,clk,rst,b);
reg16 f9(b2,clk,reset,b);
assign rst = start1|tc3|(tc4&enp2);

pg p4(start2,(tc4&q2),enp2,clk,reset);
loadcnt_up3  cnt66(,3'b000,tc3|tc4,enp2,clk,reset,tc3,lmt);
mux3_3_1 mx2(lmt1,lmt2,lmt3,s[0],s[1],lmt);
loadcnt_up3  cnt67(s,3'b000,tc4,tc3,clk,reset,tc4,3'b011);

tff tfg(start2|(tc4&q2),clk,reset,q);
tff tfg1((tc4&q)|(tc4&q2),clk,reset,q2);
////////divider.......................
divider1 dv(clk,d1,b2,,z);
Delay29 df1(clk,tc3&enp2,tr1);
assign trig = (tc4&q2);
endmodule

module lsh10(a,b);
    input [2:0] a;
    output [17:0] b;
assign {b[17:13],b[12:10],b[9:0]}= {5'b0,a,10'b0};
endmodule

module mux3_3_1(a1,a2,a3,s0,s1,y
    );
input [2:0] a1,a2,a3;
output [2:0] y;
input s0,s1;
wire [2:0] y1;
mux3 m1(a1,a2,s0,y1);
mux3 m2(y1,a3,s1,y);

endmodule


module clusters(clk,reset,start,start_avg,ena1,ena2,ena3,it_end,in,mode,mode1,outb,out1,out2,out3
    );
input [2:0] in;
input clk,reset,start,start_avg,ena1,ena2,ena3,it_end;
output mode,mode1;
output [2:0] outb,out1,out2,out3;
wire tc1,tc2,tc3;
wire [2:0] out1,out2,out3,adb1,adb2,adb3,out;
wire [2:0] outb1,outb2,outb3;
parameter data = 3'b000;
parameter lmt = 3'b110;
dpm6 m1(clk,ena1,ena1,out1,in,enp1,adb1,outb1);
count3 cnt1(out1,data,start|tc1,ena1,clk,reset,tc1,lmt);

dpm6 m2(clk,ena2,ena2,out2,in,enp2,adb2,outb2);
count3 cnt2(out2,data,start|tc2,ena2,clk,reset,tc2,lmt);

dpm6 m3(clk,ena3,ena3,out3,in,enp3,adb3,outb3);
count3 cnt3(out3,data,start|tc3,ena3,clk,reset,tc3,lmt);

tff tfg(start_avg|(tc61&mode1),clk,reset,mode);
tff tfg1((tc61&mode),clk,reset,mode1);
pg p1(start_avg|(tc61&mode),tc4,enp1,clk,reset);
count3 cnt4(adb1,3'b000,start|tc4,enp1,clk,reset,tc4,out1);

pg p2(tc4,tc5,enp2,clk,reset);
count3 cnt5(adb2,3'b000,start|tc5,enp2,clk,reset,tc5,out2);

pg p3(tc5,tc6,enp3,clk,reset);
count3 cnt6(adb3,3'b000,start|tc6,enp3,clk,reset,tc6,out3);

DFF f5(tc61,clk,reset,tc6);
mux3_3_1 mx1(outb1,outb2,outb3,enp2,enp3,outb);
//mux3_3_1 mx2(out1,out2,out3,enp2,enp3,out);
//reg3 rg(out4,clk,reset,out);
endmodule

module dpm6(clk,ena,wea,ada,ina,enb,adb,outb);

input clk,ena,wea,enb;
input[2:0] ada,adb;
input[2:0] ina;
output reg [2:0] outb;
reg [2:0] outa;
reg [2:0] mem [7:0];
initial begin $readmemh("initial.txt", mem);end
always@(posedge clk)
if(ena&wea)begin
mem[ada]=ina;
end

always@(posedge clk)
if(enb)begin
outb = mem[adb];
end
endmodule

module comp18(A1,B1,LT1,GT1,EQ1);
    input [17:0] A1,B1;
   
    output reg LT1,GT1,EQ1;
	 always @ (A1,B1)
	 begin
	 if (A1>B1)
	 begin
	 LT1 <= 0; GT1 <= 1; EQ1 <= 0;
	 end
	 else if (A1<B1)
	 begin
	 LT1 <= 1; GT1 <= 0; EQ1 <= 0;
	 end
	 else
	 begin
	 LT1 <= 0; GT1 <= 0; EQ1 <= 1;
	 end
	 end


endmodule


module sort(In,clk,start,reset,indx,indxc,start_avg);
   
input [17:0] In;
input clk,start,reset;
output indxc,start_avg;
output [1:0] indx;
wire [17:0] A,B,C,C1;
wire LT,gt;
wire [1:0] out;
parameter max = 18'b111111111111111111;
comp18 cc1(A,B,LT,gt,eq);
mux16 cc2(A,B,gt,C);
mux16 cc5(C,max,tc24|tc5,C1);
//reg16 c3(A,clk,tc25|tc5,C1);
fdce18 cc3(C1,clk,tc24|tc5|gt,reset,A);
reg16 cc4(B,clk,reset,In);

DFF df4(tc21,clk,reset,start);
DFF df5(tc22,clk,reset,tc21);
DFF df6(tc23,clk,reset,tc22);
DFF df7(tc24,clk,reset,tc23);
DFF df8(tc25,clk,reset,tc24);
pg p5(tc25,tc6,enp3,clk,reset);
count2 cnt6(out,2'b00,tc5,enp3,clk,reset,tc5,2'b10);
count3 cnt7(,3'b000,start|tc6,tc5,clk,reset,tc6,3'b111);
assign indxc = tc5 & (LT|eq);
assign start_avg1 = tc5 & tc61;
DFF df9(tc61,clk,reset,tc6);
fdc2 fd(out,clk,gt,reset,indx);
DFF df91(start_avg,clk,reset,start_avg1);
endmodule

module reg3_delay(a5,clk,reset,a
    );
input [2:0] a;
input clk,reset;
output [2:0] a5;
wire [2:0] a1,a2,a3,a4,a5;
reg3 f1(a1,clk,reset,a);
reg3 f2(a2,clk,reset,a1);
reg3 f3(a3,clk,reset,a2);
reg3 f4(a4,clk,reset,a3);
reg3 f5(a5,clk,reset,a4);
endmodule

module reg3(y,clk,reset,a);
    input [2:0] a;
    output [2:0] y;
    input clk,reset;
 
DFF d1(y[0],clk,reset,a[0]);
DFF d2(y[1],clk,reset,a[1]);
DFF d3(y[2],clk,reset,a[2]);

endmodule


module dmux3_1(a,S,y1,y2,y3
    );
input [1:0] S;
input a;
output y1,y2,y3;
Dmux m1(y1,y2,S[0],t1);
Dmux m2(t1,y3,S[1],a);
endmodule

module Dmux(A,B,S,Y);
input Y,S;
output A,B;
assign A=Y&~S;
assign B=Y&S;
endmodule

///////divider block.....
module divider1(clk,D,N,R,Q);
input clk;
input [17:0] D,N;
output [17:0] R,Q;

wire [9:0] fr;
wire s1,s2,t0;
wire [17:0] a,b,D1,N1,Q1,Q2,R1;
wire [17:0] b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,
            b19,b20,b21,b22,b23,b24,b25,b26,b27,b28;
wire [1:0] t1; wire [2:0] t2; wire [3:0] t3; wire [4:0] t4; wire [5:0] t5;
wire [6:0] t6; wire [7:0] t7; wire [8:0] t8; wire [9:0] t9; wire [10:0] t10;
wire [11:0] t11; wire [12:0] t12; wire [13:0] t13; wire [14:0] t14; wire[15:0] t15; 
wire [16:0] t16;
wire [17:0] t17,t18,t19,t20,t21,t22,t23,t24,t25,t26;
parameter reset = 1'b0, zro = 18'b0;
adsub ad1(D[17],zro,D,D1);
adsub ad2(N[17],zro,N,N1);

reg18 reg1(a,clk,reset,N1);
reg18 reg2(b,clk,reset,D1);
 
stage1 m1(a[17],b,clk,t0,Q1[17],b1);
stage2 m2({t0,a[16]},b1,clk,t1,Q1[16],b2);
stage3 m3({t1,a[15]},b2,clk,t2,Q1[15],b3);
stage4 m4({t2,a[14]},b3,clk,t3,Q1[14],b4);
stage5 m5({t3,a[13]},b4,clk,t4,Q1[13],b5);
stage6 m6({t4,a[12]},b5,clk,t5,Q1[12],b6);
stage7 m7({t5,a[11]},b6,clk,t6,Q1[11],b7);
stage8 m8({t6,a[10]},b7,clk,t7,Q1[10],b8);
stage9 m9({t7,a[9]},b8,clk,t8,Q1[9],b9);
stage10 m10({t8,a[8]},b9,clk,t9,Q1[8],b10);
stage11 m11({t9,a[7]},b10,clk,t10,Q1[7],b11);
stage12 m12({t10,a[6]},b11,clk,t11,Q1[6],b12);
stage13 m13({t11,a[5]},b12,clk,t12,Q1[5],b13);
stage14 m14({t12,a[4]},b13,clk,t13,Q1[4],b14);
stage15 m15({t13,a[3]},b14,clk,t14,Q1[3],b15);
stage16 m16({t14,a[2]},b15,clk,t15,Q1[2],b16);
stage17 m17({t15,a[1]},b16,clk,t16,Q1[1],b17);
stage18 m18({t16,a[0]},b17,clk,t17,Q1[0],b18);

stage19 m19({t17[16:0],1'b0},b18,clk,t18,fr[9],b19);
stage20 m20({t18[16:0],1'b0},b19,clk,t19,fr[8],b20);
stage21 m21({t19[16:0],1'b0},b20,clk,t20,fr[7],b21);
stage22 m22({t20[16:0],1'b0},b21,clk,t21,fr[6],b22);
stage23 m23({t21[16:0],1'b0},b22,clk,t22,fr[5],b23);
stage24 m24({t22[16:0],1'b0},b23,clk,t23,fr[4],b24);
stage25 m25({t23[16:0],1'b0},b24,clk,t24,fr[3],b25);
stage26 m26({t24[16:0],1'b0},b25,clk,t25,fr[2],b26);
stage27 m27({t25[16:0],1'b0},b26,clk,t26,fr[1],b27);
stage28 m28({t26[16:0],1'b0},b27,clk,R1,fr[0],b28);

assign Q2 = {Q1[7:0],fr};
Delay29 df1(clk,D[17],s1);
Delay29 df2(clk,N[17],s2);

adsub ad3(s1^s2,zro,Q2,Q);
adsub ad4(s1^s2,zro,R1,R);

endmodule

module reg18(y,clk,reset,a);
    input [17:0] a;
    output [17:0] y;
    input clk,reset;
 
DFF d1(y[0],clk,reset,a[0]);
DFF d2(y[1],clk,reset,a[1]);
DFF d3(y[2],clk,reset,a[2]);
DFF d4(y[3],clk,reset,a[3]);
DFF d5(y[4],clk,reset,a[4]);
DFF d6(y[5],clk,reset,a[5]);
DFF d7(y[6],clk,reset,a[6]);
DFF d8(y[7],clk,reset,a[7]);
DFF d9(y[8],clk,reset,a[8]);
DFF d10(y[9],clk,reset,a[9]);
DFF d11(y[10],clk,reset,a[10]);
DFF d12(y[11],clk,reset,a[11]);
DFF d13(y[12],clk,reset,a[12]);
DFF d14(y[13],clk,reset,a[13]);
DFF d15(y[14],clk,reset,a[14]);
DFF d16(y[15],clk,reset,a[15]);
DFF d17(y[16],clk,reset,a[16]);
DFF d18(y[17],clk,reset,a[17]);
endmodule

module stage1(a0,b,clk,d,q,b1
    );
input a0,clk;
input [17:0] b;
output d,q;
output [17:0] b1;
parameter reset = 1'b0;
wire t1,t2,t3;
assign t1 = a0 & ~b[0];
assign t2 = ~& b;
assign d = (t2 & t1) | (a0 & ~t2);
assign t3 = a0 & b[0] & t2;
Delay28 f(clk,t3,q);
reg18 f1(b1,clk,reset,b);
endmodule

module stage2(input [1:0]a,
              input [17:0] b,
				  input clk,
				  output [1:0]d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1;
parameter reset = 1'b0;

SB m2(clk,a[1],b[1],c0,d[1],c1,t1);
SB m1(clk,a00,b[0],1'b0,d[0],c0,t1);

DFF f0(a00,clk,reset,a[0]);
reg18 f1(b1,clk,reset,b);

assign t1 = | b[17:2] | c1; 
assign t2 = ~t1 & (| b[1:0]);
Delay27 f3(clk,t2,q);
endmodule

module stage3(input [2:0] a,
              input [17:0] b,
				  input clk,
				  output [2:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2;
parameter reset = 1'b0;

SB m3(clk,a[2],b[2],c1,d[2],c2,t1);
SB m4(clk,a[1],b[1],c0,d[1],c1,t1);
SB m5(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay2 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:3] | c2; 
assign t2 = ~t1 & (| b[2:0]);
Delay26 f3(clk,t2,q);
endmodule

module stage4(input [3:0] a,
              input [17:0] b,
				  input clk,
				  output [3:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2;
parameter reset = 1'b0;

SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay3 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:4] | c3; 
assign t2 = ~t1 & (| b[3:0]);
Delay25 f3(clk,t2,q);
endmodule

module stage5(input [4:0] a,
              input [17:0] b,
				  input clk,
				  output [4:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2;
parameter reset = 1'b0;

SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay4 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:5] | c4; 
assign t2 = ~t1 & (| b[4:0]);
Delay24 f3(clk,t2,q);
endmodule

module stage6(input [5:0] a,
              input [17:0] b,
				  input clk,
				  output [5:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5;
parameter reset = 1'b0;

SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay5 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:6] | c5; 
assign t2 = ~t1 & (| b[5:0]);
Delay23 f3(clk,t2,q);
endmodule

module stage7(input [6:0] a,
              input [17:0] b,
				  input clk,
				  output [6:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6;
parameter reset = 1'b0;

SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay6 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:7] | c6; 
assign t2 = ~t1 & (| b[6:0]);
Delay22 f3(clk,t2,q);
endmodule

module stage8(input [7:0]a,
              input [17:0] b,
				  input clk,
				  output [7:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7;
parameter reset = 1'b0;

SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay7 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:8] | c7; 
assign t2 = ~t1 & (| b[7:0]);
Delay21 f3(clk,t2,q);
endmodule

module stage9(input [8:0] a,
              input [17:0] b,
				  input clk,
				  output [8:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay8 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:9] | c8; 
assign t2 = ~t1 & (| b[8:0]);
Delay20 f3(clk,t2,q);
endmodule

module stage10(input [9:0] a,
              input [17:0] b,
				  input clk,
				  output [9:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay9 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:10] | c9; 
assign t2 = ~t1 & (| b[9:0]);
Delay19 f3(clk,t2,q);
endmodule


module stage11(input [10:0] a,
              input [17:0] b,
				  input clk,
				  output [10:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay10 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:11] | c10; 
assign t2 = ~t1 & (| b[10:0]);
Delay18 f3(clk,t2,q);
endmodule


module stage12(input [11:0] a,
              input [17:0] b,
				  input clk,
				  output [11:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay11 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:12] | c11; 
assign t2 = ~t1 & (| b[11:0]);
Delay17 f3(clk,t2,q);
endmodule


module stage13(input [12:0] a,
              input [17:0] b,
				  input clk,
				  output [12:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay12 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:13] | c12; 
assign t2 = ~t1 & (| b[12:0]);
Delay16 f3(clk,t2,q);
endmodule


module stage14(input [13:0] a,
              input [17:0] b,
				  input clk,
				  output [13:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay13 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:14] | c13; 
assign t2 = ~t1 & (| b[13:0]);
Delay15 f3(clk,t2,q);
endmodule


module stage15(input [14:0] a,
              input [17:0] b,
				  input clk,
				  output [14:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay14 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:15] | c14; 
assign t2 = ~t1 & (| b[14:0]);
Delay14 f3(clk,t2,q);
endmodule


module stage16(input [15:0] a,
              input [17:0] b,
				  input clk,
				  output [15:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay15 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 = | b[17:16] | c15; 
assign t2 = ~t1 & (| b[15:0]);
Delay13 f3(clk,t2,q);
endmodule

module stage17(input [16:0] a,
              input [17:0] b,
				  input clk,
				  output [16:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay16 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 =  b[17] | c16; 
assign t2 = ~t1 & (| b[16:0]);
Delay12 f3(clk,t2,q);
//DFF f3(q,clk,reset,t2);
endmodule

module stage18(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a00,b[0],1'b0,d[0],c0,t1);

Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


assign t1 =  c17; 
assign t2 = ~t1 & (| b[17:0]);
Delay11 f3(clk,t2,q);
//DFF f3(q,clk,reset,t2);
//assign q = t2;
endmodule


module stage19(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


Delay10 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module stage20(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);

Delay9 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule

module stage21(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


Delay8 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module stage22(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


Delay7 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule

module stage23(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);

Delay6 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module stage24(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


Delay5 f0(clk,t2,q);
assign t2 =  ~c17;  
assign t1 = c17;
endmodule


module stage25(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);


Delay4 f0(clk,t2,q);
assign t2 =  ~c17;  
assign t1 = c17;
endmodule

module stage26(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);

Delay3 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module stage27(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);

Delay2 f0(clk,t2,q);
assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module stage28(input [17:0] a,
              input [17:0] b,
				  input clk,
				  output [17:0] d,
				  output q,
				  output [17:0] b1
    );
wire a00,t1,t2,c0,c1,c2,c3,c4,c5,c6,c7,c8;
parameter reset = 1'b0;

SB m17(clk,a[17],b[17],c16,d[17],c17,t1);
SB m16(clk,a[16],b[16],c15,d[16],c16,t1);
SB m15(clk,a[15],b[15],c14,d[15],c15,t1);
SB m14(clk,a[14],b[14],c13,d[14],c14,t1);
SB m13(clk,a[13],b[13],c12,d[13],c13,t1);
SB m12(clk,a[12],b[12],c11,d[12],c12,t1);
SB m11(clk,a[11],b[11],c10,d[11],c11,t1);
SB m10(clk,a[10],b[10],c9,d[10],c10,t1);
SB m9(clk,a[9],b[9],c8,d[9],c9,t1);
SB m8(clk,a[8],b[8],c7,d[8],c8,t1);
SB m7(clk,a[7],b[7],c6,d[7],c7,t1);
SB m6(clk,a[6],b[6],c5,d[6],c6,t1);
SB m5(clk,a[5],b[5],c4,d[5],c5,t1);
SB m4(clk,a[4],b[4],c3,d[4],c4,t1);
SB m3(clk,a[3],b[3],c2,d[3],c3,t1);
SB m2(clk,a[2],b[2],c1,d[2],c2,t1);
SB m1(clk,a[1],b[1],c0,d[1],c1,t1);
SB m0(clk,a[0],b[0],1'b0,d[0],c0,t1);

//Delay17 f0(clk,a[0],a00);
reg18 f1(b1,clk,reset,b);

DFF f3(q,clk,reset,t2);

assign t2 =  ~c17; 
assign t1 = c17;
endmodule


module SB(input clk,a,b,bin,
          output op,bout,
			 input s
    );
wire d,op1;
FS m1(a,b,bin,d,bout);
assign op1 = (s & a) | (~s & d);
DFF f0(op,clk,1'b0,op1);
endmodule

module FS(

  input a,b,bin,

  output d,bout

    );

wire a_bar;

assign a_bar = ~a;

assign d = a^b^bin;

assign bout = (b&bin)|(b&a_bar)|(a_bar&bin);

endmodule


module Delay2(clk,d,d2);
input clk,d;
output d2;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
//DFF f3(d3,clk,reset,d2);
//DFF f4(d4,clk,reset,d3);
//DFF f5(d5,clk,reset,d4);
//DFF f6(d6,clk,reset,d5);
//DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay3(clk,d,d3);
input clk,d;
output d3;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
//DFF f4(d4,clk,reset,d3);
//DFF f5(d5,clk,reset,d4);
//DFF f6(d6,clk,reset,d5);
//DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay4(clk,d,d4);
input clk,d;
output d4;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
//DFF f5(d5,clk,reset,d4);
//DFF f6(d6,clk,reset,d5);
//DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule


module Delay5(clk,d,d5);
input clk,d;
output d5;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
//DFF f6(d6,clk,reset,d5);
//DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule


module Delay6(clk,d,d6);
input clk,d;
output d6;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
//DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule


module Delay7(clk,d,d7);
input clk,d;
output d7;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
//DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule


module Delay8(clk,d,d8);
input clk,d;
output d8;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
//DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay9(clk,d,d9);
input clk,d;
output d9;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
//DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay10(clk,d,d10);
input clk,d;
output d10;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
//DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule


module Delay11(clk,d,d11);
input clk,d;
output d11;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
//DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay12(clk,d,d12);
input clk,d;
output d12;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
//DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay13(clk,d,d13);
input clk,d;
output d13;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
//DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay14(clk,d,d14);
input clk,d;
output d14;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
//DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay15(clk,d,d15);
input clk,d;
output d15;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
//DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay16(clk,d,d16);
input clk,d;
output d16;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
parameter reset = 1'b0;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
//DFF f17(d17,clk,reset,d16);

endmodule

module Delay17(clk,d,d17);
input clk,d;
output d17;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);

endmodule

module Delay18(clk,d,d18);
input clk,d;
output d18;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
//DFF f19(d19,clk,reset,d18);
//DFF f20(d20,clk,reset,d19);
//DFF f21(d21,clk,reset,d20);
//DFF f22(d22,clk,reset,d21);
//DFF f23(d23,clk,reset,d22);
//DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay19(clk,d,d19);
input clk,d;
output d19;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
endmodule

module Delay20(clk,d,d20);
input clk,d;
output d20;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
//DFF f21(d21,clk,reset,d20);
//DFF f22(d22,clk,reset,d21);
//DFF f23(d23,clk,reset,d22);
//DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay21(clk,d,d21);
input clk,d;
output d21;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
//DFF f22(d22,clk,reset,d21);
//DFF f23(d23,clk,reset,d22);
//DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule


module Delay22(clk,d,d22);
input clk,d;
output d22;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
//DFF f23(d23,clk,reset,d22);
//DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule


module Delay23(clk,d,d23);
input clk,d;
output d23;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
//DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay24(clk,d,d24);
input clk,d;
output d24;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
//DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay25(clk,d,d25);
input clk,d;
output d25;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
DFF f25(d25,clk,reset,d24);
//DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay26(clk,d,d26);
input clk,d;
output d26;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
DFF f25(d25,clk,reset,d24);
DFF f26(d26,clk,reset,d25);
//DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay27(clk,d,d27);
input clk,d;
output d27;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
DFF f25(d25,clk,reset,d24);
DFF f26(d26,clk,reset,d25);
DFF f27(d27,clk,reset,d26);
//DFF f28(d28,clk,reset,d27);
endmodule

module Delay28(clk,d,d28);
input clk,d;
output d28;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
DFF f25(d25,clk,reset,d24);
DFF f26(d26,clk,reset,d25);
DFF f27(d27,clk,reset,d26);
DFF f28(d28,clk,reset,d27);
endmodule


module Delay29(clk,d,d29);
input clk,d;
output d29;
parameter reset = 1'b0;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,
     d20,d21,d22,d23,d24,d25,d26,d27,d28;
DFF f1(d1,clk,reset,d);
DFF f2(d2,clk,reset,d1);
DFF f3(d3,clk,reset,d2);
DFF f4(d4,clk,reset,d3);
DFF f5(d5,clk,reset,d4);
DFF f6(d6,clk,reset,d5);
DFF f7(d7,clk,reset,d6);
DFF f8(d8,clk,reset,d7);
DFF f9(d9,clk,reset,d8);
DFF f10(d10,clk,reset,d9);
DFF f11(d11,clk,reset,d10);
DFF f12(d12,clk,reset,d11);
DFF f13(d13,clk,reset,d12);
DFF f14(d14,clk,reset,d13);
DFF f15(d15,clk,reset,d14);
DFF f16(d16,clk,reset,d15);
DFF f17(d17,clk,reset,d16);
DFF f18(d18,clk,reset,d17);
DFF f19(d19,clk,reset,d18);
DFF f20(d20,clk,reset,d19);
DFF f21(d21,clk,reset,d20);
DFF f22(d22,clk,reset,d21);
DFF f23(d23,clk,reset,d22);
DFF f24(d24,clk,reset,d23);
DFF f25(d25,clk,reset,d24);
DFF f26(d26,clk,reset,d25);
DFF f27(d27,clk,reset,d26);
DFF f28(d28,clk,reset,d27);
DFF f29(d29,clk,reset,d28);
endmodule
