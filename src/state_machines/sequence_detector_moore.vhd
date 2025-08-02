library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_detector is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        data_in  : in  STD_LOGIC;
        detected : out STD_LOGIC
    );
end sequence_detector;

architecture Behavioral of sequence_detector is
    -- Define states
    type state_type is (S0, S1, S2, S3, S4);
    signal current_state, next_state : state_type;
    
begin
    -- State register (sequential process)
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    -- Next state logic (combinational process)
    process(current_state, data_in)
    begin
        case current_state is
            when S0 =>
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
                
            when S1 =>
                if data_in = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
                
            when S2 =>
                if data_in = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
                
            when S3 =>
                if data_in = '1' then
                    next_state <= S4;
                else
                    next_state <= S2;
                end if;
                
            when S4 =>
                if data_in = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
                
            when others =>
                next_state <= S0;
        end case;
    end process;
    
    -- Output logic (Moore: outputs depend only on state)
    process(current_state)
    begin
        case current_state is
            when S4 =>
                detected <= '1';
            when others =>
                detected <= '0';
        end case;
    end process;
end Behavioral;
