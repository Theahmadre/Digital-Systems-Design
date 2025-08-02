library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture Behavioral of tb_full_adder is
    signal a, b, cin, sum, cout : STD_LOGIC;
begin
    uut: entity work.full_adder
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum,
            cout => cout
        );
    
    stimulus: process
    begin
        -- Test all 8 combinations
        a <= '0'; b <= '0'; cin <= '0'; wait for 10 ns;
        a <= '0'; b <= '0'; cin <= '1'; wait for 10 ns;
        a <= '0'; b <= '1'; cin <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; cin <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; cin <= '0'; wait for 10 ns;
        a <= '1'; b <= '0'; cin <= '1'; wait for 10 ns;
        a <= '1'; b <= '1'; cin <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; cin <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
