module ecg_system(
input clk,
input rst,
input signed [15:0] ecg_in,

output peak,
output signed [15:0] filtered,
output signed [15:0] deriv,
output [31:0] squared,
output [31:0] integrated,

output [7:0] bpm,
output arrhythmia
);

wire signed [15:0] bp_out;
wire signed [15:0] df_out;
wire [31:0] sq_out;
wire [31:0] mw_out;


/* ECG Processing */

bandpass_filter BP(
.clk(clk),
.rst(rst),
.ecg_in(ecg_in),
.ecg_out(bp_out)
);

derivative_filter DF(
.clk(clk),
.rst(rst),
.signal_in(bp_out),
.signal_out(df_out)
);

squaring SQ(
.clk(clk),
.rst(rst),
.signal_in(df_out),
.signal_out(sq_out)
);

moving_window MW(
.clk(clk),
.rst(rst),
.signal_in(sq_out),
.signal_out(mw_out)
);

threshold_detector TD(
.clk(clk),
.rst(rst),
.signal_in(mw_out),
.peak(peak)
);


/* Heart Rate */

heart_rate HR(
.clk(clk),
.rst(rst),
.peak(peak),
.bpm(bpm)
);


/* Arrhythmia */

arrhythmia_detector AR(
.clk(clk),
.rst(rst),
.bpm(bpm),
.arrhythmia(arrhythmia)
);


assign filtered   = bp_out;
assign deriv      = df_out;
assign squared    = sq_out;
assign integrated = mw_out;

endmodule