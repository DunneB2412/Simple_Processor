----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2020 19:45:45
-- Design Name: 
-- Module Name: reg_oS - Behavioral
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

entity reg_oS is
    Port ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (16 downto 0);
           value : out STD_LOGIC_VECTOR (16 downto 0));
end reg_oS;

architecture Behavioral of reg_oS is
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if load='1' then
            value<=input after 5ns;
            end if;
        end if;
    end process;

end Behavioral;