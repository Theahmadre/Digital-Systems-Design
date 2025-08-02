library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_half_adder is
end tb_half_adder;

architecture Behavioral of tb_half_adder is
    signal a, b, sum, carry : STD_LOGIC;
begin
    uut: entity work.half_adder
        port map (
            a => a,
            b => b,
            sum => sum,
            carry => carry
        );
    
    stimulus: process
    begin
        a <= '0'; b <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
