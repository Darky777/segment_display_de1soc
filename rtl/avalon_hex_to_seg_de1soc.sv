module avalon_hex_to_seg_de1soc #(
    parameter NUM_SEGMENT = 6
) (
    input clk ,
    input rst_n ,

    input [ 2:0] avms_address_i ,
    input [ 3:0] avms_byteenable_i ,
    input        avms_write_i ,
    input [31:0] avms_writedata_i ,

    output [NUM_SEGMENT*6 -1:0] segment_symbol_o
);
    logic [3:0][7:0] avms_writedata_s;
    logic [NUM_SEGMENT - 1:0][3:0][7:0] data_to_out;
    logic [NUM_SEGMENT - 1:0][6:0] segment_symbol_s;
    assign avms_writedata_s = avms_writedata_i;

    always_ff @(posedge clk) begin
        if( !rst_n ) begin
           data_to_out <= '0;
        end else if ( avms_write_i ) begin
            for (int word_ind = 0; word_ind < NUM_SEGMENT; word_ind++) begin
                if(avms_address_i == word_ind) begin
                    for (int byte_ind = 0; byte_ind < 4; byte_ind++) begin
                        data_to_out[word_ind][byte_ind] <= avms_byteenable_i[byte_ind] ? avms_writedata_s[byte_ind] : data_to_out[word_ind][byte_ind];
                    end
                end
            end
        end
    end

    generate
        for (genvar seg_ind = 0; seg_ind < NUM_SEGMENT; seg_ind++) begin
                hex_to_segment_convert_de1soc i_hex_to_segment_convert_de1soc (
                    .clk_i ( clk ) ,
                    .rst_n_i ( rst_n ) ,

                    .hex_symbol_i ( data_to_out[seg_ind][0][3:0] ) ,
                    .segment_symbol_o( segment_symbol_s[seg_ind] )
                );
        end
    endgenerate

    assign segment_symbol_o = segment_symbol_s;

endmodule