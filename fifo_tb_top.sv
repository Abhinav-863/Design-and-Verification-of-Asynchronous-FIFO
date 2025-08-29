`include "fifo.v"
`include "fifo_common.sv"
`include "fifo_wr_tx.sv"
`include "fifo_rd_tx.sv"
`include "fifo_wr_gen.sv"
`include "fifo_rd_gen.sv"
`include "wr_bfm.sv"
`include "rd_bfm.sv"
`include "wr_mon.sv"
`include "rd_mon.sv"
`include "wr_agent.sv"
`include "rd_agent.sv"
`include "fifo_sbd.sv"
`include "fifo_env.sv"
`include "fifo_intf.sv"

module fifo_tb_top;
	bit wr_clk,rd_clk,rst;
	fifo_intf pif(wr_clk, rd_clk, rst);
	fifo_env env = new();
	initial begin
		env.run();
	end

	fifo dut(.wr_clk(pif.wr_clk),
			 .rd_clk(pif.rd_clk),
			 .rst(pif.rst),
			 .wr_en(pif.wr_en),
			 .rd_en(pif.rd_en),
			 .wdata(pif.wdata),
			 .rdata(pif.rdata),
			 .full(pif.full),
			 .empty(pif.empty),
			 .underflow(pif.underflow),
			 .overflow(pif.overflow));

	always begin
		wr_clk = 0;
		#5 wr_clk = ~wr_clk;
	end

	always begin
		rd_clk = 0;
		#7 rd_clk = ~rd_clk; 
	end

	initial begin
		rst = 1;
		@(posedge wr_clk);
		@(posedge wr_clk);
		rst = 0;
	end
	
	initial begin
        $value$plusargs("testname = %s",fifo_common::testname);
        $display("matches = %0d",fifo_common::matches);
        $display("mismatches = %0d",fifo_common::mismatches);
        #100;
        $finish;
	end

	initial begin
		$fsdbDumpfile("async.fsdb");
		$fsdbDumpvars(0,top);
	end
endmodule