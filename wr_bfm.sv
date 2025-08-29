class wr_bfm;
	wr_tx tx;
	fifo_intf pif;
	virtual fifo_intf vif;

	task run();
		vif = top.pif;
		tx = new();
		fifo_common::gen2bfm_wr.get(tx);
		drive_tx(tx);
		tx.print();
	endtask

	task drive_tx(wr_tx tx);
		@(posedge vif.wr_clk);
		vif.wr_en = tx.wr_en;      // dynamic to static conversion
		@(posedge vif.wr_clk);
		vif.wdata = tx.wdata;
		@(posedge vif.wr_clk);
		tx.full = vif.full;       // static to dynamic conversion
		tx.overflow = vif.overflow;
		vif.wr_en = 0;
		vif.wdata = 0;
	endtask
endclass