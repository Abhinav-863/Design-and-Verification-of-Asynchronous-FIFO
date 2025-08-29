
class rd_bfm;
	rd_tx tx;
	fifo_intf pif;
	virtual fifo_intf vif;

	task run();
		vif = top.pif;
		tx = new();
		fifo_common::gen2bfm_rd.get(tx);
		drive_tx(tx);
		tx.print();
	endtask

	task drive_tx(rd_tx tx);
		@(posedge vif.rd_clk);
		vif.rd_en = tx.rd_en;
		@(posedge vif.rd_clk);
		tx.rdata = vif.rdata;
		tx.empty = vif.empty;
		tx.underflow = vif.underflow;
		vif.rd_en = 0;
	endtask
endclass