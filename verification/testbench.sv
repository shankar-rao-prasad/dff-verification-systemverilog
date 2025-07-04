
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "env.sv"

module tb;

  dff_if vif();           // Interface instance
  dff dut(vif);           // Connect DUT with interface
  env e;        // Test environment

  // Clock generation
  initial vif.clk = 0;
  always #10 vif.clk = ~vif.clk;

  // Test logic
  initial begin
    e = new(vif);       // Pass interface to environment
    e.gen.count = 5;    // Number of test inputs
    e.run();            // Start test
  end

  // VCD dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
