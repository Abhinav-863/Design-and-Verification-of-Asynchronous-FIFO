class wr_mon;
	wr_tx tx;
	fifo_intf pif;
	virtual fifo_intf vif;

	task run();
		forever begin
			vif = top.pif;
			@(posedge vif.wr_clk);
			if(vif.wr_en == 1) begin
				tx = new();
				tx.wr_en = vif.wr_en;    // static form to dynamic form
				tx.wdata = vif.wdata;
				tx.full = vif.full;
				tx.overflow = vif.overflow;
				fifo_common::mon2sbd_wr.put(tx);
				tx.print();
			end
		end
	endtask
endclass