module SE (
    input [24:0] inm,   // 25 bits de inmediato
    input [2:0] src,    // Selecciona el tipo de instrucción
    output reg [31:0] inmExt // Salida extendida a 32 bits
);

    always @(*) begin
        case (src)
            3'b000: begin // Tipo I
                inmExt = {{20{inm[24]}}, inm[24:13]};  // Extiende el bit de signo de inm[24]
            end
            3'b001: begin // Tipo S
                inmExt = {{20{inm[24]}}, inm[24:18], inm[4:0]};  // Combina y extiende los bits
            end
            3'b010: begin // Tipo B
                inmExt = {{19{inm[24]}}, inm[24], inm[0], inm[23:18], inm[4:1]};  // Formato B
            end
            3'b011: begin // Tipo U
                inmExt = {inm[24:13], 12'b0};  // Se extiende con ceros a la derecha
            end
            3'b100: begin // Tipo J
                inmExt = {{11{inm[24]}}, inm[24:0], 1'b0}; // Extendemos el signo y añadimos un 0 al final
            end
            default: begin
                inmExt = 32'b0;  // Valor por defecto en caso de error
            end
        endcase
    end

endmodule

/*
Entrada inm: Es un valor inmediato de 25 bits, que dependiendo del tipo de instrucción, se agrupa y extiende de diferentes maneras.
Entrada src: Indica el formato de la instrucción. Por ejemplo:

    00 corresponde a las instrucciones tipo I.
    01 corresponde a las instrucciones tipo S.
    10 corresponde a las instrucciones tipo B.
    11 corresponde a las instrucciones tipo U (y otros, como el formato J, se puede agregar más tarde).

Extensión de signo: Se realiza con {{n{bit}}}, que es la sintaxis para replicar el bit de signo n veces para extender el valor a 32 bits.
*/
