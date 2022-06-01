library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           COUNT_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
    signal count_in, count_in_next: std_logic_vector(3 downto 0);
    signal delay, delay_next: std_logic_vector(24 downto 0);
begin
    process (reset, clock)
    begin
        if reset = '1' then
            delay <= (others=>'0');
            count_in <= (others=>'0');
        elsif clock='1' and clock'event then
            delay <= delay_next;
            count_in <= count_in_next;
        end if;
    end process;
    
    delay_next <= delay + 1;
    count_in_next <= count_in+1 when delay = 0 and direction = '1' else
    count_in-1 when delay = 0 and direction = '0'
    else
    count_in;
    count_out <= count_in;

end Behavioral;
