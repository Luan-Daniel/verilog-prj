// edgeDetector.v
// Moore and Mealy Implementation
module edgeDetector
(
    clk, 
	reset, 
    level, 
    Mealy_tick, 
	Moore_tick
);

input wire clk, reset;
input wire level;
output reg Mealy_tick, Moore_tick;

localparam  // 2 states are required for Mealy
    zeroMealy = 1'b0,
    oneMealy  = 1'b1;
    
localparam [1:0] // 3 states are required for Moore
    zeroMoore = 2'b00,
    edgeMoore = 2'b01, 
    oneMoore  = 2'b10;

reg stateMealy_reg;
reg stateMealy_next; 
reg[1:0] stateMoore_reg;
reg[1:0] stateMoore_next;

always @(posedge clk or posedge reset)
begin
    if(reset) // go to state zero if reset
        begin
        stateMealy_reg <= zeroMealy;
        stateMoore_reg <= zeroMoore;
        end
    else
        begin
        stateMealy_reg <= stateMealy_next;
        stateMoore_reg <= stateMoore_next;
        end
end

/* **************************************** */
/* 					MEALY					*/
/* **************************************** */
// Mealy next state 
always @(stateMealy_reg or level)
begin
    // store current state as next
    stateMealy_next = stateMealy_reg;
    case(stateMealy_reg)
        zeroMealy: if(level)  stateMealy_next = oneMealy; 
            
        oneMealy : if(~level) stateMealy_next = zeroMealy; 
    endcase
end

// Output Mealy Design 
always @(stateMealy_reg or level)
begin
    case(stateMealy_reg)
        zeroMealy: if(level)  Mealy_tick = 1'b1;
        oneMealy : if(~level) Mealy_tick = 1'b0; 
		default: Mealy_tick = 1'b0; 
    endcase
end

/* **************************************** */
/* 					MOORE					*/
/* **************************************** */
// Moore next state 
always @(stateMoore_reg or level)
begin
    // store current state as next
    stateMoore_next = stateMoore_reg;
    case(stateMoore_reg)
        zeroMoore: if(level) stateMoore_next = edgeMoore; 
        edgeMoore:
            begin
                if(level) 
					stateMoore_next = oneMoore; 
                else    
                    stateMoore_next = zeroMoore;
            end
        oneMoore:  if(~level) stateMoore_next = zeroMoore;      
    endcase
end

// Output Moore Design 
always @(stateMoore_reg)
begin
    case(stateMoore_reg)
		zeroMoore:  Moore_tick = 1'b0; 
        edgeMoore:  Moore_tick = 1'b1; 
        oneMoore:   Moore_tick = 1'b0; 
    endcase
end


endmodule
