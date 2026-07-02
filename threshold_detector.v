module threshold_detector(
input clk,
input rst,
input [31:0] signal_in,
output reg peak
);

// ✅ Tuned for your waveform
parameter THRESHOLD_HIGH = 32'd5000;
parameter THRESHOLD_LOW  = 32'd2500;

always @(posedge clk or posedge rst)
begin
    if(rst)
        peak <= 0;
    else if(signal_in > THRESHOLD_HIGH)
        peak <= 1;
    else if(signal_in < THRESHOLD_LOW)
        peak <= 0;
end

endmodule