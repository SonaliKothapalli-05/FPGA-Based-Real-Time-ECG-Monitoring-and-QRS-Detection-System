module squaring(
input clk,
input rst,
input signed [15:0] signal_in,
output reg [31:0] signal_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        signal_out <= 0;
    else
        signal_out <= signal_in * signal_in;
end

endmodule
