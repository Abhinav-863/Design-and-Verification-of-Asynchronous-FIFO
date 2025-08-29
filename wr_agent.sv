class wr_agent;
	wr_gen gen;
	wr_bfm bfm;
	wr_mon mon;
	
	task run();
		gen = new();
		bfm = new();
		mon = new();
		
		fork
			gen.run();
			bfm.run();
			mon.run();
		join
	endtask
endclass