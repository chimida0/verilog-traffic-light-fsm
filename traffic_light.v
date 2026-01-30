module traffic_light (
    input  wire clk,      // Тактовый сигнал
    input  wire reset,    // Сброс
    output reg [2:0] light // Выход: [2]-Красный, [1]-Желтый, [0]-Зеленый
);

    localparam S_GREEN  = 2'b00,
               S_YELLOW = 2'b01,
               S_RED    = 2'b10;

    reg [1:0] current_state, next_state;
    reg [3:0] counter; // Счетчик времени для каждого цвета

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S_RED;
            counter <= 0;
        end else begin
            if (counter == 4'd10) begin // Условно держим свет 10 тактов
                current_state <= next_state;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    always @(*) begin
        case (current_state)
            S_RED:    next_state = S_GREEN;
            S_GREEN:  next_state = S_YELLOW;
            S_YELLOW: next_state = S_RED;
            default:  next_state = S_RED;
        endcase
    end

    always @(*) begin
        case (current_state)
            S_RED:    light = 3'b100;
            S_YELLOW: light = 3'b010;
            S_GREEN:  light = 3'b001;
            default:  light = 3'b000;
        endcase
    end

endmodule
