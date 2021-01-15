----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2020 20:13:46
-- Design Name: 
-- Module Name: mux_txoS - Behavioral
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

entity mux_txoS is
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (16 downto 0);
           b : in STD_LOGIC_VECTOR (16 downto 0);
           o : out STD_LOGIC_VECTOR (16 downto 0));
end mux_txoS;

architecture Behavioral of mux_txoS is

begin
    process(s,a,b)
    begin
        if(s='1') then o <= b after 5ns;
        else o <= a after 5ns;
        end if;
    end process;

end Behavioral;