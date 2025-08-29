interface fifo_intf(input bit wr_clk, input bit rd_clk, rst);
	bit wr_en;
	bit rd_en;
	bit [7:0]wdata;
	bit [7:0]rdata;
	bit full;
	bit empty;
	bit overflow;
	bit underflow;
endinterface
