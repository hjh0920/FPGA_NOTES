# TCL脚本

- Author：hongjh
- Time：20230328
- Version:

---------

[toc]

## AXI JTAG

通过例化 axi_jtag IP，可实现通过 vivado tcl 窗口 控制寄存器读写

```TCL
# read
proc rr {address}{
    puts "Start reading operation"
    create_hw_axi_txn rd_txn [get_hw_axis hw_axi_1] -address $address -type reading
    run_hw_axi rd_txn
    set read_value [lindex [report_hw_axi_txn rd_txn] 1]
    delete_hw_axi_axi_txn rd_txn
    return $read_value
}
# write
proc wr {address data}{
    create_hw_axi_txn wr_txn [get_hw_axis hw_axi_1] -type write -address $address -data $data
    run_hw_axi wr_txn
    delete_hw_axi_axi_txn wr_txn
}
```

