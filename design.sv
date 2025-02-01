module shift_register_variable #(
    parameter WIDTH = 8 // Default register width is 8 bits
) (
    input logic clk,                 // Clock signal
    input logic reset,               // Asynchronous reset
    input logic [3:0] shift_count,   // Number of shifts (up to 15 shifts)
    input logic dir,                 // Shift direction: 0 for left, 1 for right
    input logic serial_in,           // Serial input for new bits
    output logic [WIDTH-1:0] q       // Shift register output
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= '0; // Clear register on reset
        end else begin
            // Perform the specified number of shifts
            for (int i = 0; i < shift_count; i++) begin
                if (dir == 0) begin
                    // Left shift
                    q <= {q[WIDTH-2:0], serial_in};
                end else begin
                    // Right shift
                    q <= {serial_in, q[WIDTH-1:1]};
                end
            end
        end
    end
endmodule
