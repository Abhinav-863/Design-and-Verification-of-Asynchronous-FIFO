class fifo_common;
	static string testname;
	static	mailbox gen2bfm_wr = new();
	static	mailbox gen2bfm_rd = new();
	static	wr_count = 10;
	static	rd_count = 5;
	static	mailbox mon2sbd_wr = new();
	static	mailbox mon2sbd_rd = new();
	static	int matches;
	static	int mis_matches;
endclass