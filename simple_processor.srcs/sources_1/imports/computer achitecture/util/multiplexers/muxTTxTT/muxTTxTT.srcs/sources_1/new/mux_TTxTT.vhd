----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 12:06:23
-- Design Name: 
-- Module Name: mux_TTxTT - Behavioral
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

entity mux_TTxTT is
    Port ( sig : in STD_LOGIC_VECTOR (4 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           c : in STD_LOGIC_VECTOR (31 downto 0);
           d : in STD_LOGIC_VECTOR (31 downto 0);
           e : in STD_LOGIC_VECTOR (31 downto 0);
           f : in STD_LOGIC_VECTOR (31 downto 0);
           g : in STD_LOGIC_VECTOR (31 downto 0);
           h : in STD_LOGIC_VECTOR (31 downto 0);
           i : in STD_LOGIC_VECTOR (31 downto 0);
           j : in STD_LOGIC_VECTOR (31 downto 0);
           k : in STD_LOGIC_VECTOR (31 downto 0);
           l : in STD_LOGIC_VECTOR (31 downto 0);
           m : in STD_LOGIC_VECTOR (31 downto 0);
           n : in STD_LOGIC_VECTOR (31 downto 0);
           o : in STD_LOGIC_VECTOR (31 downto 0);
           p : in STD_LOGIC_VECTOR (31 downto 0);
           q : in STD_LOGIC_VECTOR (31 downto 0);
           r : in STD_LOGIC_VECTOR (31 downto 0);
           s : in STD_LOGIC_VECTOR (31 downto 0);
           t : in STD_LOGIC_VECTOR (31 downto 0);
           u : in STD_LOGIC_VECTOR (31 downto 0);
           v : in STD_LOGIC_VECTOR (31 downto 0);
           w : in STD_LOGIC_VECTOR (31 downto 0);
           x : in STD_LOGIC_VECTOR (31 downto 0);
           y : in STD_LOGIC_VECTOR (31 downto 0);
           z : in STD_LOGIC_VECTOR (31 downto 0);
           aa : in STD_LOGIC_VECTOR (31 downto 0);
           ab : in STD_LOGIC_VECTOR (31 downto 0);
           ac : in STD_LOGIC_VECTOR (31 downto 0);
           ad : in STD_LOGIC_VECTOR (31 downto 0);
           ae : in STD_LOGIC_VECTOR (31 downto 0);
           af : in STD_LOGIC_VECTOR (31 downto 0);
           ou : out STD_LOGIC_VECTOR (31 downto 0));
           
           
end mux_TTxTT;

architecture Behavioral of mux_TTxTT is

begin
    process ( sig,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,aa,ab,ac,ad,ae,af)
		begin
		case  sig is
			when "00000" => ou <= a after 5ns;
			when "00001" => ou <= b after 5ns;
			when "00010" => ou <= c after 5ns;
			when "00011" => ou <= d after 5ns;
			when "00100" => ou <= e after 5ns;
			when "00101" => ou <= f after 5ns;
			when "00110" => ou <= g after 5ns;
			when "00111" => ou <= h after 5ns;
			when "01000" => ou <= i after 5ns;
			when "01001" => ou <= j after 5ns;
			when "01010" => ou <= k after 5ns;
			when "01011" => ou <= l after 5ns;
			when "01100" => ou <= m after 5ns;
			when "01101" => ou <= n after 5ns;
			when "01110" => ou <= o after 5ns;
			when "01111" => ou <= p after 5ns;
			when "10000" => ou <= q after 5ns;
			when "10001" => ou <= r after 5ns;
			when "10010" => ou <= s after 5ns;
			when "10011" => ou <= t after 5ns;
			when "10100" => ou <= u after 5ns;
			when "10101" => ou <= v after 5ns;
			when "10110" => ou <= w after 5ns;
			when "10111" => ou <= x after 5ns;
			when "11000" => ou <= y after 5ns;
			when "11001" => ou <= z after 5ns;
			when "11010" => ou <= aa after 5ns;
			when "11011" => ou <= ab after 5ns;
			when "11100" => ou <= ac after 5ns;
			when "11101" => ou <= ad after 5ns;
			when "11110" => ou <= ae after 5ns;
			when "11111" => ou <= af after 5ns;
			when others => ou <= a after 5ns;
		end case;
	end process;
end Behavioral;
