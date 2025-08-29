class fifo_wr_gen;
	wr_tx tx;
	task run();
		case(fifo_common::testname)
		"test_wr": begin
						$display("performing n transactions");
						write(fifo_common::wr_count);
					end
		"test_full":begin
						$display("performing full transactions");
						write(fifo_common::wr_count);
					end
		"test_overflow": begin
							$display("performing overflow condition");
							write(fifo_common::wr_count);
						 end
		endcase
	endtask

	task write(int count);
		repeat(count) begin
			tx = new();
			tx.randomize() with {wr_en == 1;};
			fifo_common::gen2bfm_wr.put(tx);
			$display("wr_transactions");
			tx.print();
		end
	endtask
endclass