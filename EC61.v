
module EC61(clk, rst, car, HG, HY, HR, FG, FR, FY);
    input clk, rst, car;
    output reg HG, HY, HR, FG, FR, FY;
    reg [2:0] state;
    reg [1:0] f_count;  // Counter for the number of clock cycles for farm road green light
    reg [1:0] hg_count; // Counter for highway green light duration

    // State machine behavior
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 3'b000;    // HG state
            f_count <= 2'b00;
            hg_count <= 2'b00;  // Initialize highway green cycle counter
            HG <= 1;            // Highway Green light on
            HY <= 0;            // Highway Yellow light off
            HR <= 0;            // Highway Red light off
            FG <= 0;            // Farm Green light off
            FR <= 1;            // Farm Red light on
            FY <= 0;            // Farm Yellow light off
        end else begin
            case(state)
                3'b000: begin // HG (Initial state, Highway Green, Farm Road Red)
                    HG <= 1;    // Highway Green
                    FR <= 1;    // Farm Road Red
                    if (hg_count < 2) begin
                        hg_count <= hg_count + 1; // Count up to 3 cycles
                        state <= 3'b000;
                    end else if (car) begin
                        state <= 3'b001; // Transition to HY if car is detected
                    end
                end

                3'b001: begin // HY (Highway Yellow)
                    HG <= 0;    // Highway Green off
                    HY <= 1;    // Highway Yellow on
                    HR <= 0;    // Highway Red off
                    if (car) begin
                        state <= 3'b010; // Transition to HR after 1 cycle
                    end
                end

                3'b010: begin // HR (Highway Red)
                    HY <= 0;    // Highway Yellow off
                    HR <= 1;    // Highway Red on
                    if (f_count < 2) begin
                        state <= 3'b100; // Transition to FG after 2 cycles of HR
                        f_count <= f_count + 1;
                    end else begin
                        state <= 3'b111; // Transition to FR (Farm Road Red)
                    end
                end

                3'b100: begin // FG (Farm Road Green)
                    FR <= 0;    // Farm Red off
                    FG <= 1;    // Farm Green on
                    if (!car) begin
                        state <= 3'b101; // Transition to FY if car is no longer present
                    end
                end

                3'b101: begin // FY (Farm Road Yellow)
                    FG <= 0;    // Farm Green off
                    FY <= 1;    // Farm Yellow on
                    state <= 3'b111; // Transition to FR (Farm Road Red)
                end

                3'b111: begin // FR (Farm Road Red)
                    FY <= 0;    // Farm Yellow off
                    FR <= 1;    // Farm Red on
                    state <= 3'b000; // Return to HG state (Highway Green)
                    hg_count <= 0;  // Reset highway green cycle counter
                    f_count <= 0;  // Reset farm green cycle counter
                end

                default: begin
                    state <= 3'b000; // Default to HG
                end
            endcase
        end
    end
endmodule
