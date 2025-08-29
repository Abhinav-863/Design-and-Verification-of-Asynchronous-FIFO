class fifo_rd_tx;
	rand bit rd_en;				// input
	bit [7:0]rdata;             // output
	bit empty;                  // output
	bit underflow;              // output
	function void print();
		$display("rd_en = %b, rdata = %0d, empty = %b, underflow = %b",rd_en,rdata,empty,underflow);
	endfunction
endclass
