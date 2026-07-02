module derivative_filter(
input clk,
input rst,
input signed [15:0] signal_in,
output reg signed [15:0] signal_out
);

reg signed [15:0] prev1;
reg signed [15:0] prev2;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        prev1 <= 0;
        prev2 <= 0;
        signal_out <= 0;
    end
    else
    begin
        signal_out <= signal_in - prev2;
        prev2 <= prev1;
        prev1 <= signal_in;
    end
end

endmodule