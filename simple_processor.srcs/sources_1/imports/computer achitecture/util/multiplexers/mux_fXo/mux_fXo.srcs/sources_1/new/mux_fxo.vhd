----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 16:28:53
-- Design Name: 
-- Module Name: mux_fxo - Behavioral
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

entity mux_fxo is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           o : out STD_LOGIC);
end mux_fxo;

architecture Behavioral of mux_fxo is

begin
    process ( s,a,b,c,d)
		begin
		case  s is
			when "00" => o <= a after 5ns;
			when "01" => o <= b after 5ns;
			when "10" => o <= c after 5ns;
			when "11" => o <= d after 5ns;
			when others => o <= a after 5ns;
		end case;
	end process;

end Behavioral;
