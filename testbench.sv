module tb_votingMachine;

    reg clock;
    reg reset;
    reg mode;
    reg [8:0] vote_C1;
    reg [8:0] vote_C2;
    reg [8:0] vote_C3;

    // Output wires
    wire [8:0] count_C1;
    wire [8:0] count_C2;
    wire [8:0] count_C3;

    // Instantiate the Unit Under Test (UUT)
    VotingMachine uut (
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .valid_vote_casted(1'b0), // Connect or bind appropriately
        .vote_c1(vote_C1),
        .vote_c2(vote_C2),
        .vote_c3(vote_C3),
        .count_C1(count_C1),
        .count_C2(count_C2),
        .count_C3(count_C3)
    );

    // Clock Generation
    initial begin
      $dumpfile("votingMachine.vcd");
      $dumpvars(0, tb_votingMachine);
        clock = 0;
        forever #5 clock = ~clock;
    end
    // Initial Setup & Stimulus
    initial begin
        reset = 1; 
        mode = 0; 
        vote_C1 = 0; 
        vote_C2 = 0; 
        vote_C3 = 0;

        #30 vote_C1 = 4; #15 vote_C1 = 0;
        #30 vote_C2 = 2; #15 vote_C2 = 0;
        #30 vote_C3 = 9; #15 vote_C3 = 0;
        #30 vote_C2 = 1; #15 vote_C2 = 0;

        #45 reset = 1;
        #100 $finish;
    end

endmodule