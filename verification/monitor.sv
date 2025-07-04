class monitor;
  transaction tr; // Define a transaction object
  mailbox #(transaction) mbx; // Create a mailbox to send data to the scoreboard
  virtual dff_if vif; // Virtual interface for DUT
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx; // Initialize the mailbox for sending data to the scoreboard
  endfunction
  
  task run();
    tr = new(); // Create a new transaction
    forever begin
      repeat(2) @(posedge vif.clk); // Wait for two rising edges of the clock
      tr.dout = vif.dout; // Capture DUT output
      mbx.put(tr); // Send the captured data to the scoreboard
      tr.display("MON"); // Display transaction information
    end
  endtask
  
endclass
