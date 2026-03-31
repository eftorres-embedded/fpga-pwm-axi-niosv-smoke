module fpga_pwm_axi_niosv_smoke_test1(

	//////////// CLOCK //////////
	input		logic         		ADC_CLK_10,
	input 	logic         		MAX10_CLK1_50,
	input 	logic         		MAX10_CLK2_50,

	//////////// SDRAM //////////
	output	logic		[12:0]	DRAM_ADDR,
	output	logic		[1:0]		DRAM_BA,
	output	logic        		DRAM_CAS_N,
	output	logic        		DRAM_CKE,
	output	logic        		DRAM_CLK,
	output	logic        		DRAM_CS_N,
	inout 	logic		[15:0]	DRAM_DQ,
	output	logic        		DRAM_LDQM,
	output	logic        		DRAM_RAS_N,
	output	logic        		DRAM_UDQM,
	output	logic        		DRAM_WE_N,

	//////////// SEG7 //////////
	output	logic		[7:0]		HEX0,
	output	logic		[7:0]		HEX1,
	output	logic		[7:0]		HEX2,
	output	logic		[7:0]		HEX3,
	output	logic		[7:0]		HEX4,
	output	logic		[7:0]		HEX5,

	//////////// KEY //////////
	input		logic		[1:0]		KEY,

	//////////// LED //////////
	output	logic		[9:0]		LEDR,

	//////////// SW //////////
	input		logic		[9:0]		SW,

	//////////// VGA //////////
	output	logic		[3:0]		VGA_B,
	output	logic		[3:0]		VGA_G,
	output	logic					VGA_HS,
	output	logic		[3:0]		VGA_R,
	output	logic					VGA_VS,

	//////////// Accelerometer //////////
	output	logic					GSENSOR_CS_N,
	input		logic	[2:1]			GSENSOR_INT,
	output	logic					GSENSOR_SCLK,
	inout		logic					GSENSOR_SDI,
	inout		logic					GSENSOR_SDO,

	//////////// Arduino //////////
	inout		logic	[15:0]		ARDUINO_IO,
	inout		logic					ARDUINO_RESET_N,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout		logic	[35:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic	reset_n;
	logic	pwm_out;



//=======================================================
//  Structural coding
//=======================================================
	assign reset_n	=	KEY[0];
	assign LEDR[0]	=	pwm_out;
	
	//Instatiate Platform Designer system
	system	u0(
		.clk_clk(MAX10_CLK1_50),
		.reset_reset_n(reset_n),
		.pwm_conduit(pwm_out));


endmodule
