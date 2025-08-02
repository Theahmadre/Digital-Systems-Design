library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_4bit is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        d      : in  STD_LOGIC_VECTOR(3 downto 0);
        q      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end register_4bit;

architecture Behavioral of register_4bit is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= (others => '0');
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;
