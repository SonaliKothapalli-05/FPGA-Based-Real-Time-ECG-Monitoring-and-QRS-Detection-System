module heart_rate(
input clk,
input rst,
input peak,
output reg [7:0] bpm
);

reg [15:0] counter;
reg [7:0] beat_count;
reg peak_prev;

parameter WINDOW = 2500;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        counter <= 0;
        beat_count <= 0;
        bpm <= 0;
        peak_prev <= 0;
    end
    else
    begin
        counter <= counter + 1;

        // ✅ Count only rising edge
        if(peak && !peak_prev)
            beat_count <= beat_count + 1;

        peak_prev <= peak;

        if(counter == WINDOW)
        begin
            bpm <= beat_count * 6;
            counter <= 0;
            beat_count <= 0;
        end
    end
end

endmodule