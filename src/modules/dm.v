module DM #(parameter N = 32) (
    input clk,
    input [4:0] addressDM,
    input [N-1:0] wd,
    input we,
    output [N-1:0] rd
);
    reg [N-1:0] mem [31:0]; // 32 registros de 32 bits

    assign rd = mem[addressDM];

    always @(posedge clk) begin
        if (we) begin
            mem[addressDM] <= wd;
        end
    end
endmodule

/*
Memoria de datos: es la región de la memoria del sistema donde se alojan los datos
utilizados por el programa (datos dinamicos y estaticos, pila)

Sus entradas son la dirección de memoria accedida (A), los datos que se escriben (WD), la
señal de escritura (WE) y el reloj del sistema (CLK), la salida es la información (RD) que se
halla en dicha dirección. Las señales RD, WD y A tienen 32 bits de ancho.
*/