----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 10:57:12
-- Design Name: 
-- Module Name: flag_register - Behavioral
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

entity flag_register is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           FR : in STD_LOGIC_VECTOR (3 downto 0);
           load, clk : in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (3 downto 0));
end flag_register;

architecture Behavioral of flag_register is

begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if load='1' then
            value<=input after 5ns;
            end if;
            if(FR(0)='1') then
                value(0) <= '0';
            end if;
            if(FR(1)='1') then
                value(1) <= '0';
            end if;
            if(FR(2)='1') then
                value(2) <= '0';
            end if;
            if(FR(3)='1') then
                value(3) <= '0';
            end if;
        end if;
    end process;


end Behavioral;
