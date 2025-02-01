class shift_register_scoreboard;
    virtual shift_register_if ifc;

    // Constructor
    function new(virtual shift_register_if ifc);
        this.ifc = ifc;
    endfunction

    // Task to check output
    task check(input logic [ifc.WIDTH-1:0] expected_q);
        @(posedge ifc.clk);
        if (ifc.q !== expected_q) begin
            $error("Mismatch at time %0t: Expected %b, Got %b", $time, expected_q, ifc.q);
        end else begin
            $display("Match at time %0t: q = %b", $time, ifc.q);
        end
    endtask
endclass
