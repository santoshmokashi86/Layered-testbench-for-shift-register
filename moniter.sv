class shift_register_monitor;
    virtual shift_register_if ifc;

    // Constructor
    function new(virtual shift_register_if ifc);
        this.ifc = ifc;
    endfunction

    // Task to observe and print outputs
    task observe();
        forever begin
            @(posedge ifc.clk);
            $display("Time: %0t | q: %b", $time, ifc.q);
        end
    endtask
endclass
