# Testbench用例

- Author：hongjh
- Time：20210731
- Version:

---------

[toc]

## axi_lite_task

```verilog
task AXI_LITE_WR;
    input [31:0] address;
    input [31:0] data;
    begin
        @(posedge S_AXI_ACLK)
            S_AXI_AWADDR    = address;
            S_AXI_WDATA     = data;
            S_AXI_WSTRB     = 4'hF;
            S_AXI_AWVALID   = 1'b1;
            S_AXI_WVALID    = 1'b1;
        fork
            begin
                @(negedge S_AXI_AWREADY);
                S_AXI_AWADDR  = 32'h0;
                S_AXI_AWVALID = 1'b0;
            end
            begin
                @(negedge S_AXI_WREADY);
                S_AXI_WDATA  = 32'h0;
                S_AXI_WVALID = 1'b1;
                S_AXI_WSTRB  = 4'h0;
            end
            begin
                @(posedge S_AXI_BVALID);
                S_AXI_BREADY = 1'b1;
                repeat(1) @(posedge S_AXI_ACLK);
                S_AXI_BREADY = 1'b0;
            end
        join
        repeat(1) @(posedge S_AXI_ACLK);
    end
endtask

task AXI_LITE_RD;
    input [31:0] address;
    begin
        @(posedge S_AXI_ACLK);
        S_AXI_ARADDR  = address;
        S_AXI_ARVALID = 1'b1;
        S_AXI_RREADY  = 1'b1;
        fork
            begin
                @(negedge S_AXI_ARREADY);
                S_AXI_ARADDR  = 32'h0;
                S_AXI_ARVALID = 1'b0;
            end
            begin
                @(negedge S_AXI_RVALID);
                S_AXI_RREADY = 1'b0;
            end
        join
        $display("The AXILITE_RD read data = 32'h%h", S_AXI_RDATA);
        repeat(1) @(posedge S_AXI_ACLK);
    end
endtask
```

