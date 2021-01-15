----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 20:00:46
-- Design Name: 
-- Module Name: mux_exo - Behavioral
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

entity mux_exo is
    Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           e : in STD_LOGIC;
           f : in STD_LOGIC;
           g : in STD_LOGIC;
           h : in STD_LOGIC;
           o : out STD_LOGIC);
end mux_exo;

architecture Behavioral of mux_exo is

begin
    process ( s,a,b,c,d,e,f,g,h)
		begin
		case  s is
			when "000" => o <= a after 5ns;
			when "001" => o <= b after 5ns;
			when "010" => o <= c after 5ns;
			when "011" => o <= d after 5ns;
			when "100" => o <= e after 5ns;
			when "101" => o <= f after 5ns;
			when "110" => o <= g after 5ns;
			when "111" => o <= h after 5ns;
			when others => o <= a after 5ns;
		end case;
	end process;

end Behavioral;