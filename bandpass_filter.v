module bandpass_filter(
input clk,
input rst,
input signed [15:0] ecg_in,
output reg signed [15:0] ecg_out
);

reg signed [15:0] prev1;
reg signed [15:0] prev2;

// ✅ Offset to remove negative baseline
wire signed [15:0] shifted;
assign shifted = ecg_in + 16'd400;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        prev1 <= 0;
        prev2 <= 0;
        ecg_out <= 0;
    end
    else
    begin
        // ✅ Normalize + amplify signal
        ecg_out <= ((shifted - prev1 + prev2) <<< 2);

        prev2 <= prev1;
        prev1 <= shifted;
    end
end

endmodule