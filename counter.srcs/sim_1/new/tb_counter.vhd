LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY counter_tbw IS
END counter_tbw;

ARCHITECTURE behavior OF counter_tbw IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT counter
    PORT(
        CLOCK : IN std_logic;
        reset : IN std_logic;
        DIRECTION : IN std_logic;
        COUNT_OUT : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    --Inputs
    signal CLOCK : std_logic := '0';
    signal reset : std_logic := '0';
    signal DIRECTION : std_logic := '0';

    --Outputs
    signal COUNT_OUT : std_logic_vector(3 downto 0);

    -- Clock period definitions
    constant CLOCK_period : time := 40ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: counter PORT MAP (
        CLOCK => CLOCK,
        reset => reset,
        DIRECTION => DIRECTION,
        COUNT_OUT => COUNT_OUT
    );

    -- Clock process definitions
    CLOCK_process :process
    begin
        CLOCK <= '0';
        wait for CLOCK_period/2;
        CLOCK <= '1';
        wait for CLOCK_period/2;
    end process;

    -- reset process definitions
    reset_process:process
    begin
        reset <= '1';
        for i in 1 to 2 loop
            wait until clock='1';
        end loop;
        reset <='0';
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        DIRECTION <= '1';
        wait for 1400ns; --current Time:1400ns
        
        DIRECTION <='0';
        wait for 800ns; -- current Time:2200ns
        DIRECTION <= '1';
        wait;
    end process;
end;