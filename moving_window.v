module moving_window(
input clk,
input rst,
input [31:0] signal_in,
output reg [31:0] signal_out
);

reg [31:0] s1;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        s1 <= 0;
        signal_out <= 0;
    end
    else
    begin
        // ✅ Less averaging → peaks remain sharp
        signal_out <= (signal_in + s1) >> 1;
        s1 <= signal_in;
    end
end

endmodule