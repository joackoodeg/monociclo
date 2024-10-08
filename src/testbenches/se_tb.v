`timescale 1ns / 1ps

`include "../src/modules/se.v"

module SE_tb;

    reg [24:0] imm;       // Inmediato de 25 bits
    reg [1:0] src;        // Señal de control de 2 bits
    wire [31:0] immExt;   // Inmediato extendido a 32 bits

    // Instanciar el módulo SE
    SE uut (
        .imm(imm),
        .src(src),
        .immExt(immExt)
    );

    initial begin
        // Prueba para Tipo I
        imm = 25'b1111111111111111111111111; // Inmediato negativo
        src = 2'b00; // Tipo I
        #10;
        
        // Prueba para Tipo U
        imm = 25'b0000000000000000000000000; // Inmediato positivo
        src = 2'b01; // Tipo U
        #10;
        
        // Prueba para Tipo J
        imm = 25'b1111111111111111111111111; // Inmediato negativo
        src = 2'b10; // Tipo J
        #10;

        // Fin de la simulación
        $finish;
    end

endmodule
