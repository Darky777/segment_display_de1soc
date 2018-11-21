`timescale 1ns / 1ps
module avalon_hex_to_seg_de1soc_tb;
    parameter real FREQ  = 100.0            ; // MHZ
    parameter real CYCLE = 1.0 * 1000.0/FREQ;

    /*------------------------------------------------------------------------------
    --   Signals declaration
    ------------------------------------------------------------------------------*/



    bit clk;
    bit rst_n;
    bit [2:0] avms_address_i;
    bit [3:0] avms_byteenable_i;
    bit avms_write_i;
    bit [31:0] avms_writedata_i;
    logic [6*6-1:0] segment_symbol_o;

    /*------------------------------------------------------------------------------
    --  DUT
    ------------------------------------------------------------------------------*/

    avalon_hex_to_seg_de1soc i_avalon_hex_to_seg_de1soc (
        .clk ( clk ),
        .rst_n ( rst_n ) ,

        .avms_address_i ( avms_address_i ) ,
        .avms_byteenable_i( avms_byteenable_i ) ,
        .avms_write_i ( avms_write_i ) ,
        .avms_writedata_i ( avms_writedata_i ) ,

        .segment_symbol_o ( segment_symbol_o )
    );


    /*------------------------------------------------------------------------------
    --  TASKS
    ------------------------------------------------------------------------------*/
    task automatic cycles(input int number, ref bit clk,input real time_cycle);
        repeat (number) @(posedge clk) #(time_cycle/10.0);
    endtask : cycles

    task write_data (input int addr,input bit [31:0] data,input bit [3:0] byte_enable);
        avms_write_i = 1;
        avms_address_i = addr;
        avms_byteenable_i = byte_enable;
        avms_writedata_i = data;
        cycles(1,clk,CYCLE);
        avms_write_i = 0;
        avms_byteenable_i = 0;
    endtask : write_data

    /*------------------------------------------------------------------------------
    --   Behavior
    ------------------------------------------------------------------------------*/
    always #(CYCLE/2.0) clk = !clk  ;

    initial begin
        rst_n = 0;
        cycles(5,clk,CYCLE);
        rst_n = 1;
        cycles(5,clk,CYCLE);
        for (int i = 0; i < 6; i++) begin
            write_data(i,i,4'h2);
        end
        cycles(5,clk,CYCLE);
        $stop;
    end
endmodule