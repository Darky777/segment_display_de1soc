module avalon_hex_to_seg_de1soc #(
    parameter NUM_SEGMENT = 6
) (
    input clk ,
    input rst_n ,

    input [ 2:0] avms_address_i ,
    input        avms_write_i ,
    input [7:0] avms_writedata_i ,

    output [NUM_SEGMENT*7 -1:0] segment_symbol_o
);

    logic [NUM_SEGMENT - 1:0][7:0] data_to_out;
    logic [NUM_SEGMENT - 1:0][6:0] segment_symbol_s;

    integer word_ind ;
    always_ff @(posedge clk) begin
        if( !rst_n ) begin
           data_to_out <= '0;
        end else if ( avms_write_i ) begin
            for ( word_ind = 0; word_ind < NUM_SEGMENT; word_ind++) begin
                if(avms_address_i == word_ind) begin
                    data_to_out[word_ind] <= avms_writedata_i;
                end
            end
        end
    end
    genvar seg_ind ;
    generate
        for ( seg_ind = 0; seg_ind < NUM_SEGMENT; seg_ind++) begin : segment_conver_genblck
                hex_to_segment_convert_de1soc i_hex_to_segment_convert_de1soc (
                    .clk_i ( clk ) ,
                    .rst_n_i ( rst_n ) ,

                    .hex_symbol_i ( data_to_out[seg_ind] ) ,
                    .segment_symbol_o( segment_symbol_s[seg_ind] )
                );
        end
    endgenerate

    assign segment_symbol_o = segment_symbol_s;

endmodule