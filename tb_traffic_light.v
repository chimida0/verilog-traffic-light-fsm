module tb_traffic_light(); 
    reg clk;
    reg reset;
    wire [2:0] light;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    // Генерация тактового сигнала
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_traffic_light);
        
        clk = 0;
        reset = 1;
        #20 reset = 0;
        #500 $finish;
    end
endmodule
