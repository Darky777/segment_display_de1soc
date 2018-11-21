module hex_to_segment_convert_de1soc (
    input clk_i ,    // Clock
    input rst_n_i ,  // Asynchronous reset active low
    input [3:0] hex_symbol_i ,
    output logic [6:0] segment_symbol_o
);

    always_ff @(posedge clk_i or negedge rst_n_i) begin
        if(~rst_n_i) begin
            segment_symbol_o <= 7'd0;
        end else begin
            case (hex_symbol_i)
                4'h0 : segment_symbol_o <= 7'b0111111 ;
                4'h1 : segment_symbol_o <= 7'b0000110 ;
                4'h2 : segment_symbol_o <= 7'b1010111 ;
                4'h3 : segment_symbol_o <= 7'b1001111 ;
                4'h4 : segment_symbol_o <= 7'b1100111 ;
                4'h5 : segment_symbol_o <= 7'b1101101 ;
                4'h6 : segment_symbol_o <= 7'b1111101 ;
                4'h7 : segment_symbol_o <= 7'b0000111 ;
                4'h8 : segment_symbol_o <= 7'b1111111 ;
                4'h9 : segment_symbol_o <= 7'b1101111 ;
                4'ha : segment_symbol_o <= 7'b1110111 ;
                4'hb : segment_symbol_o <= 7'b1111100 ;
                4'hc : segment_symbol_o <= 7'b0111001 ;
                4'hd : segment_symbol_o <= 7'b1011110 ; // Hexadecimal D
                4'he : segment_symbol_o <= 7'b1111001 ; // Hexadecimal E
                4'hf : segment_symbol_o <= 7'b1110001 ; // Hexadecimal F
            endcase
        end
    end

endmodule