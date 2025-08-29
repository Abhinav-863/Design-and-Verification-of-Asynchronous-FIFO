class fifo_wr_tx;
	rand bit wr_en;               // input
	rand bit [7:0]wdata;          // input
	bit full;                // output
	bit overflow;            // output
	function void print();
		$display("wr_en = %0b, wdata = %0d, full = %0b, overflow = %b",wr_en,wdata,full,overflow);
	endfunction
endclass