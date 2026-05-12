module comparator(
    input  [31:0] a,
    input  [31:0] b,
    output eq,
    output neq,
    output lt,
    output gt,
    output le,
    output ge
);
assign eq  = (a == b);
assign neq = (a != b);
assign lt  = ($signed(a) <  $signed(b));
assign gt  = ($signed(a) >  $signed(b));
assign le  = ($signed(a) <= $signed(b));
assign ge  = ($signed(a) >= $signed(b));
endmodule
