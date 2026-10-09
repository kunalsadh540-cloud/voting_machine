module votingMachine(
    input clock,
    input reset,
    input button,
    output reg valid_vote
);
    reg [20:0] counter;

    always @(posedge clock) begin
        if (reset)
            counter <= 0;
        else begin
            if (button & counter < 12)
                counter <= counter + 1;
            else if (!button)
                counter <= 0;
        end
    end

    always @(posedge clock) begin
        if (reset)
            valid_vote <= 1'b0;
        else begin
            if (counter == 12)
                valid_vote <= 1'b1;
            else
                valid_vote <= 1'b0;
        end
    end
endmodule


module VotingMachine(
    input clock,
    input reset,
    input mode,
    input valid_vote_casted,
    input [8:0] vote_c1,      // Changed to lowercase to match logic below
    input [8:0] vote_c2,
    input [8:0] vote_c3,
    output reg [8:0] count_C1,
    output reg [8:0] count_C2,
    output reg [8:0] count_C3
);

    // Sequential logic for vote counting
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            count_C1 <= 9'b0;
            count_C2 <= 9'b0;
            count_C3 <= 9'b0;
        end else begin
            if (vote_c1) count_C1 <= count_C1 + 1;
            if (vote_c2) count_C2 <= count_C2 + 1;
            if (vote_c3) count_C3 <= count_C3 + 1;
        end
    end

endmodule