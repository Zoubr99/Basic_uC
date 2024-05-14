module cordic_sine_generator_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    logic clk = 0;
    logic signed [15:0] angle_in = 0;
    logic signed [15:0] sine_out;

    // Instantiate the unit under test (UUT)
    cordic_sine_generator uut(
        .clk(clk),
        .angle_in(angle_in),
        .sine_out(sine_out)
    );

    // Clock generation
    always begin
	#(CLK_PERIOD / 2) clk = ~clk;
    end
    // Test stimulus
    initial begin
        // Initialize inputs
        angle_in = 0;

        // Apply inputs and observe outputs for a few cycles
        repeat (360) begin
            #CLK_PERIOD;
            angle_in = angle_in + 1;
            $display("Angle: %d, Sine: %d", angle_in, sine_out);
        end

        // End simulation
        $stop;
    end

endmodule

