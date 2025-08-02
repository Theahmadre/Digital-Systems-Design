library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port (
        sel   : in  STD_LOGIC_VECTOR(1 downto 0);
        in0   : in  STD_LOGIC;
        in1   : in  STD_LOGIC;
        in2   : in  STD_LOGIC;
        in3   : in  STD_LOGIC;
        out0  : out STD_LOGIC
    );
end mux_4to1;

architecture Behavioral of mux_4to1 is
begin
    with sel select
        out0 <= in0 when "00",
                in1 when "01",
                in2 when "10",
                in3 when "11",
                '0' when others;
end Behavioral;
