class shift_register_driver;
    virtual shift_register_if ifc;

    // Constructor
    function new(virtual shift_register_if ifc);
        this.ifc = ifc;
    endfunction

    // Task to drive inputs
    task drive(input logic reset, input logic dir, input logic [3:0] shift_count, input logic serial_in);
        ifc.reset <= reset;
        ifc.dir <= dir;
        ifc.shift_count <= shift_count;
        ifc.serial_in <= serial_in;
        #10; // Wait for inputs to propagate
    endtask
endclass
