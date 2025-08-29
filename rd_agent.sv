class rd_agent;
	rd_gen gen;
	rd_bfm bfm;
	rd_mon mon;

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
