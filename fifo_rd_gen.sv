class fifo_rd_gen;
	rd_tx tx;
	task run();
		case(fifo_common::testname)
		"test_rd": begin
						$display("performing read transactions");
						read(fifo_common::rd_count);
                    end
		"test_empty": begin
						$display("performing empty condition");
						read(fifo_common::rd_count);
					end
		"test_underflow": begin
							$display("performing underflow condition");
							read(fifo_common::rd_count);
						end
		endcase
	endtask

	task read(int count);
		repeat(count) begin
			tx = new();
			tx.randomize() with {rd_en == 1;};
			fifo_common::gen2bfm_rd.put(tx);
			$display("read transactions");
			tx.print();
		end
	endtask
endclass