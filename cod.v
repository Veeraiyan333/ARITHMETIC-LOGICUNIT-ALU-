module alu (
    input [3:0] A, B,     // 4-bit inputs
    input [2:0] sel,      // select input to choose operation
    output reg [3:0] Y    // 4-bit output
);

always @(*) begin
    case (sel)
        3'b000: Y = A + B;       // Addition
        3'b001: Y = A - B;       // Subtraction
        3'b010: Y = A & B;       // AND
        3'b011: Y = A | B;       // OR
        3'b100: Y = ~A;          // NOT A
        default: Y = 4'b0000;
    endcase
end

endmodule
module tb_alu;

reg [3:0] A, B;
reg [2:0] sel;
wire [3:0] Y;

alu uut (
    .A(A), 
    .B(B), 
    .sel(sel), 
    .Y(Y)
);

initial begin
    $monitor("Time = %0t | A = %b | B = %b | sel = %b | Y = %b", $time, A, B, sel, Y);

    A = 4'b0101; B = 4'b0011; sel = 3'b000; #10; // ADD
    sel = 3'b001; #10;                          // SUB
    sel = 3'b010; #10;                          // AND
    sel = 3'b011; #10;                          // OR
    sel = 3'b100; #10;                          // NOT A

    $stop;
end

endmodule
