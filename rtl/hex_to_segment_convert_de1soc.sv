module hex_to_segment_convert_de1soc (
    input clk_i ,
    input rst_n_i ,
    input [3:0] hex_symbol_i ,
    output logic [6:0] segment_symbol_o
);

    logic [6:0] segment_symbol ;
    always_ff @(posedge clk_i or negedge rst_n_i) begin
        if(~rst_n_i) begin
            segment_symbol <= 7'd0;
        end else begin
            case (hex_symbol_i)
                8'h20: segment_symbol <= 7'b0000000 ; /* (space) */
                8'h21: segment_symbol <= 7'b0000110 ; /* ! */
                8'h22: segment_symbol <= 7'b0100010 ; /* " */
                8'h23: segment_symbol <= 7'b1111110 ; /* # */
                8'h24: segment_symbol <= 7'b1101101 ; /* $ */
                8'h25: segment_symbol <= 7'b1010010 ; /* % */
                8'h26: segment_symbol <= 7'b1000110 ; /* & */
                8'h27: segment_symbol <= 7'b0100000 ; /* ' */
                8'h28: segment_symbol <= 7'b0101001 ; /* ( */
                8'h29: segment_symbol <= 7'b0001011 ; /* ) */
                8'h2a: segment_symbol <= 7'b0100001 ; /* * */
                8'h2b: segment_symbol <= 7'b1110000 ; /* + */
                8'h2c: segment_symbol <= 7'b0010000 ; /* , */
                8'h2d: segment_symbol <= 7'b1000000 ; /* - */
                8'h2e: segment_symbol <= 7'b0000000 ; /* . */
                8'h2f: segment_symbol <= 7'b1010010 ; /* / */
                8'h30: segment_symbol <= 7'b0111111 ; /* 0 */
                8'h31: segment_symbol <= 7'b0000110 ; /* 1 */
                8'h32: segment_symbol <= 7'b1011011 ; /* 2 */
                8'h33: segment_symbol <= 7'b1001111 ; /* 3 */
                8'h34: segment_symbol <= 7'b1100110 ; /* 4 */
                8'h35: segment_symbol <= 7'b1101101 ; /* 5 */
                8'h36: segment_symbol <= 7'b1111101 ; /* 6 */
                8'h37: segment_symbol <= 7'b0000111 ; /* 7 */
                8'h38: segment_symbol <= 7'b1111111 ; /* 8 */
                8'h39: segment_symbol <= 7'b1101111 ; /* 9 */
                8'h3a: segment_symbol <= 7'b0001001 ; /* : */
                8'h3b: segment_symbol <= 7'b0001101 ; /* ; */
                8'h3c: segment_symbol <= 7'b1100001 ; /* < */
                8'h3d: segment_symbol <= 7'b1001000 ; /* = */
                8'h3e: segment_symbol <= 7'b1000011 ; /* > */
                8'h3f: segment_symbol <= 7'b1010011 ; /* ? */
                8'h40: segment_symbol <= 7'b1011111 ; /* @ */
                8'h41: segment_symbol <= 7'b1110111 ; /* A */
                8'h42: segment_symbol <= 7'b1111100 ; /* B */
                8'h43: segment_symbol <= 7'b0111001 ; /* C */
                8'h44: segment_symbol <= 7'b1011110 ; /* D */
                8'h45: segment_symbol <= 7'b1111001 ; /* E */
                8'h46: segment_symbol <= 7'b1110001 ; /* F */
                8'h47: segment_symbol <= 7'b0111101 ; /* G */
                8'h48: segment_symbol <= 7'b1110110 ; /* H */
                8'h49: segment_symbol <= 7'b0110000 ; /* I */
                8'h4a: segment_symbol <= 7'b0011110 ; /* J */
                8'h4b: segment_symbol <= 7'b1110101 ; /* K */
                8'h4c: segment_symbol <= 7'b0111000 ; /* L */
                8'h4d: segment_symbol <= 7'b0010101 ; /* M */
                8'h4e: segment_symbol <= 7'b0110111 ; /* N */
                8'h4f: segment_symbol <= 7'b0111111 ; /* O */
                8'h50: segment_symbol <= 7'b1110011 ; /* P */
                8'h51: segment_symbol <= 7'b1101011 ; /* Q */
                8'h52: segment_symbol <= 7'b0110011 ; /* R */
                8'h53: segment_symbol <= 7'b1101101 ; /* S */
                8'h54: segment_symbol <= 7'b1111000 ; /* T */
                8'h55: segment_symbol <= 7'b0111110 ; /* U */
                8'h56: segment_symbol <= 7'b0111110 ; /* V */
                8'h57: segment_symbol <= 7'b0101010 ; /* W */
                8'h58: segment_symbol <= 7'b1110110 ; /* X */
                8'h59: segment_symbol <= 7'b1101110 ; /* Y */
                8'h5a: segment_symbol <= 7'b1011011 ; /* Z */
                8'h5b: segment_symbol <= 7'b0111001 ; /* [ */
                8'h5c: segment_symbol <= 7'b1100100 ; /* \ */
                8'h5d: segment_symbol <= 7'b0001111 ; /* ] */
                8'h5e: segment_symbol <= 7'b0100011 ; /* ^ */
                8'h5f: segment_symbol <= 7'b0001000 ; /* _ */
                8'h60: segment_symbol <= 7'b0000010 ; /* ` */
                8'h61: segment_symbol <= 7'b1011111 ; /* a */
                8'h62: segment_symbol <= 7'b1111100 ; /* b */
                8'h63: segment_symbol <= 7'b1011000 ; /* c */
                8'h64: segment_symbol <= 7'b1011110 ; /* d */
                8'h65: segment_symbol <= 7'b1111011 ; /* e */
                8'h66: segment_symbol <= 7'b1110001 ; /* f */
                8'h67: segment_symbol <= 7'b1101111 ; /* g */
                8'h68: segment_symbol <= 7'b1110100 ; /* h */
                8'h69: segment_symbol <= 7'b0010000 ; /* i */
                8'h6a: segment_symbol <= 7'b0001100 ; /* j */
                8'h6b: segment_symbol <= 7'b1110101 ; /* k */
                8'h6c: segment_symbol <= 7'b0110000 ; /* l */
                8'h6d: segment_symbol <= 7'b0010100 ; /* m */
                8'h6e: segment_symbol <= 7'b1010100 ; /* n */
                8'h6f: segment_symbol <= 7'b1011100 ; /* o */
                8'h70: segment_symbol <= 7'b1110011 ; /* p */
                8'h71: segment_symbol <= 7'b1100111 ; /* q */
                8'h72: segment_symbol <= 7'b1010000 ; /* r */
                8'h73: segment_symbol <= 7'b1101101 ; /* s */
                8'h74: segment_symbol <= 7'b1111000 ; /* t */
                8'h75: segment_symbol <= 7'b0011100 ; /* u */
                8'h76: segment_symbol <= 7'b0011100 ; /* v */
                8'h77: segment_symbol <= 7'b0010100 ; /* w */
                8'h78: segment_symbol <= 7'b1110110 ; /* x */
                8'h79: segment_symbol <= 7'b1101110 ; /* y */
                8'h7a: segment_symbol <= 7'b1011011 ; /* z */
                8'h7b: segment_symbol <= 7'b1000110 ; /* { */
                8'h7c: segment_symbol <= 7'b0110000 ; /* | */
                8'h7d: segment_symbol <= 7'b1110000 ; /* } */
                8'h7e: segment_symbol <= 7'b0000001 ; /* ~ */
                8'h7f: segment_symbol <= 7'b0000000 ; /* (del) */
                default: segment_symbol <= 7'b0000000 ;
            endcase
        end
    end
    assign segment_symbol_o = ~segment_symbol;
endmodule