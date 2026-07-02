`timescale 1ns / 1ps

module ecg_tb;

reg clk;
reg rst;
reg signed [15:0] ecg_in;

wire peak;
wire signed [15:0] filtered;
wire signed [15:0] deriv;
wire [31:0] squared;
wire [31:0] integrated;

wire [7:0] bpm;
wire arrhythmia;

integer file_in;
integer file_out;
integer status;
integer sample;


// DUT
ecg_system uut (
    .clk(clk),
    .rst(rst),
    .ecg_in(ecg_in),

    .peak(peak),
    .filtered(filtered),
    .deriv(deriv),
    .squared(squared),
    .integrated(integrated),

    .bpm(bpm),
    .arrhythmia(arrhythmia)
);


// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


// Main simulation
initial begin

    rst = 1;
    ecg_in = 0;
    sample = 0;

    #20;
    rst = 0;

    // ✅ Use simple path (RECOMMENDED)
    file_in  = $fopen("ecg_input.txt","r");
    file_out = $fopen("ecg_final.csv","w");

    // ✅ File check
    if(file_in == 0)
    begin
        $display("ERROR: Input file not found!");
        $finish;
    end

    $fwrite(file_out,"Sample,ECG,Filtered,Derivative,Squared,Integrated,Peak,BPM,Arrhythmia\n");

    // ✅ Increased samples for proper BPM
    for(sample = 0; sample < 20000; sample = sample + 1)
    begin

        // ✅ Correct fscanf usage (Vivado-safe)
        status = $fscanf(file_in,"%d", ecg_in);

        if(status != 1)
            ecg_in = 0;

        #10;

        $fwrite(file_out,"%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
        sample,
        ecg_in,
        filtered,
        deriv,
        squared,
        integrated,
        peak,
        bpm,
        arrhythmia);

    end

    $fclose(file_in);
    $fclose(file_out);

    #100;
    $finish;

end

endmodule

