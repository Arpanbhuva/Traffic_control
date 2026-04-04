module EC61_TB();
    reg clk, rst, car;
    wire HG, HY, HR, FG, FR, FY;
    wire[2:0] state;
    wire [1:0] f_count;  // Counter for the number of clock cycles for farm road green light
    wire[1:0] hg_count; // Counter for highway green light duration
EC61 uut(clk, rst, car, HG, HY, HR, FG, FR, FY);
initial
begin
clk = 0;
rst = 1'b0;
#10
clk = 1;
rst = 1'b0;
car = 1'b0;
#10
clk = 0;
rst = 1'b0;
car = 1'b0;
#20
clk = 1;
rst = 1'b0;
car = 1'b1;
#40
clk = 0;
rst = 1'b0;
car = 1'b1;
#60
clk = 1;
rst = 1'b0;
car = 1'b0;
#80
clk = 0;
rst = 1'b0;
car = 1'b0;
end
endmodule
