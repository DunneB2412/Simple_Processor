----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 11:11:24
-- Design Name: 
-- Module Name: dec_Tt - Behavioral
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

entity dec_Tt is
    Port ( sig : in STD_LOGIC_VECTOR (4 downto 0);
           a : out STD_LOGIC;
           b : out STD_LOGIC;
           c : out STD_LOGIC;
           d : out STD_LOGIC;
           e : out STD_LOGIC;
           f : out STD_LOGIC;
           g : out STD_LOGIC;
           h : out STD_LOGIC;
           i : out STD_LOGIC;
           j : out STD_LOGIC;
           k : out STD_LOGIC;
           l : out STD_LOGIC;
           m : out STD_LOGIC;
           n : out STD_LOGIC;
           o : out STD_LOGIC;
           p : out STD_LOGIC;
           q : out STD_LOGIC;
           r : out STD_LOGIC;
           s : out STD_LOGIC;
           t : out STD_LOGIC;
           u : out STD_LOGIC;
           v : out STD_LOGIC;
           w : out STD_LOGIC;
           x : out STD_LOGIC;
           y : out STD_LOGIC;
           z : out STD_LOGIC;
           aa : out STD_LOGIC;
           ab : out STD_LOGIC;
           ac : out STD_LOGIC;
           ad : out STD_LOGIC;
           ae : out STD_LOGIC;
           af : out STD_LOGIC);
end dec_Tt;

architecture Behavioral of dec_Tt is

begin

   process (sig)
   begin
   a <= not(sig(4)) and not(sig(3)) and not(sig(2)) and not(sig(1)) and not(sig(0)) after 5ns;
   b <= not(sig(4)) and not(sig(3)) and not(sig(2)) and not(sig(1)) and sig(0) after 5ns;
   c <= not(sig(4)) and not(sig(3)) and not(sig(2)) and sig(1) and not(sig(0)) after 5ns;
   d <= not(sig(4)) and not(sig(3)) and not(sig(2)) and sig(1) and sig(0) after 5ns;
   e <= not(sig(4)) and not(sig(3)) and sig(2) and not(sig(1)) and not(sig(0)) after 5ns;
   f <= not(sig(4)) and not(sig(3)) and sig(2) and not(sig(1)) and sig(0) after 5ns;
   g <= not(sig(4)) and not(sig(3)) and sig(2) and sig(1) and not(sig(0)) after 5ns;
   h <= not(sig(4)) and not(sig(3)) and sig(2) and sig(1) and sig(0) after 5ns;
   i <= not(sig(4)) and sig(3) and not(sig(2)) and not(sig(1)) and not(sig(0)) after 5ns;
   j <= not(sig(4)) and sig(3) and not(sig(2)) and not(sig(1)) and sig(0) after 5ns;
   k <= not(sig(4)) and sig(3) and not(sig(2)) and sig(1) and not(sig(0)) after 5ns;
   l <= not(sig(4)) and sig(3) and not(sig(2)) and sig(1) and sig(0) after 5ns;
   m <= not(sig(4)) and sig(3) and sig(2) and not(sig(1)) and not(sig(0)) after 5ns;
   n <= not(sig(4)) and sig(3) and sig(2) and not(sig(1)) and sig(0) after 5ns;
   o <= not(sig(4)) and sig(3) and sig(2) and sig(1) and not(sig(0)) after 5ns;
   p <= not(sig(4)) and sig(3) and sig(2) and sig(1) and sig(0) after 5ns;
   q <= sig(4) and not(sig(3)) and not(sig(2)) and not(sig(1)) and not(sig(0)) after 5ns;
   r <= sig(4) and not(sig(3)) and not(sig(2)) and not(sig(1)) and sig(0) after 5ns;
   s <= sig(4) and not(sig(3)) and not(sig(2)) and sig(1) and not(sig(0)) after 5ns;
   t <= sig(4) and not(sig(3)) and not(sig(2)) and sig(1) and sig(0) after 5ns;
   u <= sig(4) and not(sig(3)) and sig(2) and not(sig(1)) and not(sig(0)) after 5ns;
   v <= sig(4) and not(sig(3)) and sig(2) and not(sig(1)) and sig(0) after 5ns;
   w <= sig(4) and not(sig(3)) and sig(2) and sig(1) and not(sig(0)) after 5ns;
   x <= sig(4) and not(sig(3)) and sig(2) and sig(1) and sig(0) after 5ns;
   y <= sig(4) and sig(3) and not(sig(2)) and not(sig(1)) and not(sig(0)) after 5ns;
   z <= sig(4) and sig(3) and not(sig(2)) and not(sig(1)) and sig(0) after 5ns;
   aa <= sig(4) and sig(3) and not(sig(2)) and sig(1) and not(sig(0)) after 5ns;
   ab <= sig(4) and sig(3) and not(sig(2)) and sig(1) and sig(0) after 5ns;
   ac <= sig(4) and sig(3) and sig(2) and not(sig(1)) and not(sig(0)) after 5ns;
   ad <= sig(4) and sig(3) and sig(2) and not(sig(1)) and sig(0) after 5ns;
   ae <= sig(4) and sig(3) and sig(2) and sig(1) and not(sig(0)) after 5ns;
   af <= sig(4) and sig(3) and sig(2) and sig(1) and sig(0) after 5ns;
   end process;

end Behavioral;