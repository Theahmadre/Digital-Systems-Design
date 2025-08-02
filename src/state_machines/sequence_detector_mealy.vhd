library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_sequence_detector is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        data_in  : in  STD_LOGIC;
        detected : out STD_LOGIC
    );
end mealy_sequence_detector;

architecture Behavioral of mealy_sequence_detector is
    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;
    
begin
    -- State register
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    -- Next state and output logic (combined for Mealy)
    process(current_state, data_in)
    begin
        -- Default values
        next_state <= current_state;
        detected <= '0';
        
        case current_state is
            when S0 =>
                if data_in = '1' then
                    next_state <= S1;
                end if;
                
            when S1 =>
                if data_in = '0' then
                    next_state <= S2;
                end if;
                
            when S2 =>
                if data_in = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
                
            when S3 =>
                if data_in = '1' then
                    detected <= '1';
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;
                
            when others =>
                next_state <= S0;
        end case;
    end process;
end Behavioral;
