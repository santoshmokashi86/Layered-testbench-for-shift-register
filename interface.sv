interface shift_register_if #(parameter WIDTH = 8);
    logic clk, reset, dir, serial_in;
    logic [3:0] shift_count;
    logic [WIDTH-1:0] q; // DUT output

    // Clock generation
    always #5 clk = ~clk;

    // Initialization
    initial begin
        clk = 0; reset = 0; dir = 0; serial_in = 0; shift_count = 0;
    end
endinterface
