`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/16 09:24:49
// Design Name: 
// Module Name: nn_v1
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


module nn_v1(
	input CLK,
	input RST,
	output [3:0] LED,
	output [7:0] seg,
	output [3:0] segsel
    );
	 
	 reg [24:0] neurons_D;
	 reg [24:0] neurons_J;
	 reg [24:0] neurons_C;
	 reg [24:0] neurons_M;
	 
    reg signed [4:0] links [624:0];
    reg [24:0] neurons;
    
    reg signed [4:0] tmp;
    integer x;
    integer y;
    
	 LED7Seg(CLK, seg, segsel, neurons[15:0]);

    always @(posedge CLK) begin
    	if(~RST) begin
            `include "neurons_init.txt"; 
        end else begin
            `include "create_neurons.txt"; 
        end
		`include "neurons_D_init.txt";
		`include "neurons_J_init.txt";
		`include "neurons_C_init.txt";
		`include "neurons_M_init.txt";
		`include "sinaps_init.txt";
    end

	assign LED[0] = |(neurons_D ^ neurons);
	assign LED[1] = |(neurons_J ^ neurons);
	assign LED[2] = |(neurons_C ^ neurons);
	assign LED[3] = |(neurons_M ^ neurons);
	//assign neurons_out = neurons;
endmodule