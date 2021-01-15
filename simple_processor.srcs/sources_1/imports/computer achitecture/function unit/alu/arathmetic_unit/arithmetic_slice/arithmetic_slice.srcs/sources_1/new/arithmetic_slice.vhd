----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2020 18:05:08
-- Design Name: 
-- Module Name: arithmetic_slice - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmetic_slice is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           co : out STD_LOGIC;
           g : out STD_LOGIC);
end arithmetic_slice;

architecture Behavioral of arithmetic_slice is
    
    component full_adder 
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           s : out STD_LOGIC;
           co : out STD_LOGIC);
    end component;
    signal y : std_logic;
begin
    
    adder: full_adder port map(
        a => a,
        b => y,
        ci => ci,
        s => g,
        co => co
    );
    
    process (s, b)
    begin
        y <= (b and s(0)) or (not(b) and s(1)) after 5ns;
    end process;

end Behavioral;
