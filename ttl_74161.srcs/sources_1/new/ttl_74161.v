// 4-bit modulo 16 binary counter with parallel load, asynchronous clear

module ttl_74161(
    input ld,
    input [3:0] p,
    output reg [3:0] q,
    input cet,
    input cep,
    input clk,
    output tc,
    input clr
 );
assign tc = cet & (&q);
initial begin
    q <= 0;
end
always @ (posedge clk or negedge clr) begin
    if (clr) begin
        q <= 0;
    end else begin
        if (ld == 1) begin
            q <= p;
        end
        if (cep & cet) begin
            q <= q + 1;
        end  
    end   
end
endmodule
