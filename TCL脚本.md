# TCL脚本

- Author：hongjh
- Time：20230328
- Version:

---------

[toc]

## AXI JTAG

通过例化 axi_jtag IP，可实现通过 vivado tcl 窗口 控制寄存器读写

```TCL
# Read Register
proc ReadReg {address} {
    set address [format 0x%08x $address]
    create_hw_axi_txn rd_txn [get_hw_axis hw_axi_1] -address $address -type read
    run_hw_axi rd_txn
    set read_value [lindex [report_hw_axi_txn rd_txn] 1]
    delete_hw_axi_txn rd_txn
    return $read_value
}
# Write Register
proc WriteReg {address data} {
    set address [format 0x%08x $address]
    set data [format 0x%08x $data]
    create_hw_axi_txn wr_txn [get_hw_axis hw_axi_1] -type write -address $address -data $data
    run_hw_axi wr_txn
    set write_value [lindex [report_hw_axi_txn wr_txn] 1]
    delete_hw_axi_txn wr_txn
    return $write_value
}
```

## 读写文件

### 文件访问模式

| 访问模式 | 含义                                                         |
| -------- | ------------------------------------------------------------ |
| r        | 只读模式. 指定文件必须存在; 如果不指定访问模式, 则此模式为默认模式 |
| r+       | 可读写模式. 指定文件必须存在                                 |
| w        | 只写模式. 如果文件存在, 则删除文件中的全部内容; 如果文件不存在, 则创建一个新的空文件 |
| w+       | 可读写模式. 如果文件存在, 则删除文件中的全部内容; 如果文件不存在, 则创建一个新的空文件 |
| a        | 只写模式. 将初始访问位置设为文件尾, 故新写入的内容将添加到文件原有内容后, 除非重新设置了访问位置. 如果文件不存在, 则创建一个新的空文件 |
| a+       | 可读写模式. 将初始访问位置设为文件尾, 故新写入的内容将添加到文件原有内容后, 除非重新设置了访问位置. 如果文件不存在, 则创建一个新的空文件 |

### 读文件

```TCL
######################## 读文件到变量 line ########################
# 命令eof, 一旦读取到文件末尾, 该命令就返回 1
set fn "./data.txt"
set fid [open $fn r+]
while {[eof $fid] != 1} {
    gets $fid line
    puts $line
}
close $fid
```

### 写文件

```tcl
######################## 写文件 ########################
set fn "./data.txt"
set fid [open $fn w+]
set num 1
while {$num <= 1000} {
    puts $fid [format 0x%08x $num]
    incr num
}
close $fid
```

