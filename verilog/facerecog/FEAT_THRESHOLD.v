/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2007 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file FEAT_THRESHOLD.v when simulating
// the core, FEAT_THRESHOLD. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module FEAT_THRESHOLD(
	clka,
	dina,
	addra,
	wea,
	douta);


input clka;
input [16 : 0] dina;
input [11 : 0] addra;
input [0 : 0] wea;
output [16 : 0] douta;

// synthesis translate_off

      BLK_MEM_GEN_V2_4 #(
		.C_ADDRA_WIDTH(12),
		.C_ADDRB_WIDTH(12),
		.C_ALGORITHM(1),
		.C_BYTE_SIZE(9),
		.C_COMMON_CLK(0),
		.C_DEFAULT_DATA("0"),
		.C_DISABLE_WARN_BHV_COLL(0),
		.C_DISABLE_WARN_BHV_RANGE(0),
		.C_FAMILY("virtex5"),
		.C_HAS_ENA(0),
		.C_HAS_ENB(0),
		.C_HAS_MEM_OUTPUT_REGS(0),
		.C_HAS_MUX_OUTPUT_REGS(0),
		.C_HAS_REGCEA(0),
		.C_HAS_REGCEB(0),
		.C_HAS_SSRA(0),
		.C_HAS_SSRB(0),
		.C_INIT_FILE_NAME("FEAT_THRESHOLD.mif"),
		.C_LOAD_INIT_FILE(1),
		.C_MEM_TYPE(0),
		.C_PRIM_TYPE(1),
		.C_READ_DEPTH_A(2135),
		.C_READ_DEPTH_B(2135),
		.C_READ_WIDTH_A(17),
		.C_READ_WIDTH_B(17),
		.C_SIM_COLLISION_CHECK("ALL"),
		.C_SINITA_VAL("0"),
		.C_SINITB_VAL("0"),
		.C_USE_BYTE_WEA(0),
		.C_USE_BYTE_WEB(0),
		.C_USE_DEFAULT_DATA(0),
		.C_USE_ECC(0),
		.C_USE_RAMB16BWER_RST_BHV(0),
		.C_WEA_WIDTH(1),
		.C_WEB_WIDTH(1),
		.C_WRITE_DEPTH_A(2135),
		.C_WRITE_DEPTH_B(2135),
		.C_WRITE_MODE_A("READ_FIRST"),
		.C_WRITE_MODE_B("WRITE_FIRST"),
		.C_WRITE_WIDTH_A(17),
		.C_WRITE_WIDTH_B(17),
		.C_XDEVICEFAMILY("virtex5"))
	inst (
		.CLKA(clka),
		.DINA(dina),
		.ADDRA(addra),
		.WEA(wea),
		.DOUTA(douta),
		.ENA(),
		.REGCEA(),
		.SSRA(),
		.CLKB(),
		.DINB(),
		.ADDRB(),
		.ENB(),
		.REGCEB(),
		.WEB(),
		.SSRB(),
		.DOUTB(),
		.DBITERR(),
		.SBITERR());


// synthesis translate_on

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of FEAT_THRESHOLD is "black_box"

endmodule

