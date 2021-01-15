----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.12.2020 23:24:21
-- Design Name: 
-- Module Name: simple_processor_tb - Behavioral
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

entity simple_processor_tb is
--  Port ( );
end simple_processor_tb;

architecture Behavioral of simple_processor_tb is

    component processor_simple
    Port ( clk, reset : in STD_LOGIC);
    end component;

    signal clk: STD_LOGIC:='0';
    signal reset: STD_LOGIC:='1';
begin
    
    uut: processor_simple port map(
        clk => clk,
        reset => reset
    );
    
    clk <= not clk after 500ns / 2;
    
    process is
    begin
        wait for 300ns; -- let reset happen. 1 cycles. i'm not storeing this in cm 
        reset <= '0';
    
        wait;
    end process;
  

end Behavioral;
