class rd_mon;
	rd_tx tx;
	fifo_intf pif;
	virtual fifo_intf vif;

	task run();
	forever begin
		vif = top.pif;
		@(posedge vif.rd_clk);
		if(vif.rd_en == 1) begin
			tx = new();
			tx.rd_en = vif.rd_en;
			tx.rdata = vif.rdata;
			tx.empty = vif.empty;
			tx.undeflow = vif.underflow;
			fifo_common::mon2sbd_rd.put(tx);
			tx.print();
		end
	end
	endtask
endclass