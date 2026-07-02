module arrhythmia_detector(
input clk,
input rst,
input [7:0] bpm,
output reg arrhythmia
);

parameter LOW_LIMIT  = 8'd60;
parameter HIGH_LIMIT = 8'd100;

always @(posedge clk or posedge rst)
begin
    if(rst)
        arrhythmia <= 0;
    else
        arrhythmia <= (bpm < LOW_LIMIT || bpm > HIGH_LIMIT);
end

endmodule