library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sequence_detector_mealy is
end tb_sequence_detector_mealy;

architecture Behavioral of tb_sequence_detector_mealy is
    component sequence_detector_mealy
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            data_in  : in  STD_LOGIC;
            detected : out STD_LOGIC
        );
    end component;

    signal clk      : STD_LOGIC := '0';
    signal reset    : STD_LOGIC := '1';
    signal data_in  : STD_LOGIC := '0';
    signal detected : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;
    
begin
    uut: sequence_detector_mealy port map (
        clk => clk,
        reset => reset,
        data_in => data_in,
        detected => detected
    );

    -- Clock generation
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        reset <= '1';
        wait for CLK_PERIOD*2;
        reset <= '0';
        
        report "Starting Mealy FSM test sequence";
        
        -- Test case 1: 1-0-1-1 (should detect at 4th cycle immediately)
        data_in <= '1'; wait for CLK_PERIOD;
        assert detected = '0' report "TC1: Error at cycle 1" severity error;
        
        data_in <= '0'; wait for CLK_PERIOD;
        assert detected = '0' report "TC1: Error at cycle 2" severity error;
        
        data_in <= '1'; wait for CLK_PERIOD;
        assert detected = '0' report "TC1: Error at cycle 3" severity error;
        
        data_in <= '1'; wait for CLK_PERIOD;
        assert detected = '1' report "TC1: Sequence not detected" severity error;
        
        -- Mealy detects immediately, so check during same cycle
        wait for 1 ns; -- Small delta delay
        assert detected = '1' report "TC1: Mealy output not immediate" severity error;
        
        -- Test case 2: 1-1-0-1-1 (should detect at 5th cycle immediately)
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '0'; wait for CLK_PERIOD;
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '1'; wait for CLK_PERIOD;
        assert detected = '1' report "TC2: Sequence not detected" severity error;
        
        -- Test case 3: Partial sequence 1-0-1-0 (should not detect)
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '0'; wait for CLK_PERIOD;
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '0'; wait for CLK_PERIOD;
        assert detected = '0' report "TC3: False detection" severity error;
        
        -- Test case 4: Verify Mealy immediate response
        data_in <= '1'; wait for CLK_PERIOD;
        data_in <= '0'; wait for CLK_PERIOD;
        data_in <= '1'; wait until rising_edge(clk);
        data_in <= '1'; 
        wait for 1 ns; -- Check immediately after input changes
        assert detected = '1' report "TC4: Mealy not immediate" severity error;
        wait for CLK_PERIOD-1 ns;
        
        report "Mealy FSM test completed";
        wait;
    end process;
end Behavioral;
