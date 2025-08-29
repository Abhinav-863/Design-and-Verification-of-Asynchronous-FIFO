class fifo_env;
	wr_agent wra;
	rd_agent rda;
	fifo_sbd sbd;

	task run();
		wra = new();
		rda = new();
		sbd = new();

		fork 
			wra.run();
			rda.run();
			sbd.run();
		join
	endtask
endclass