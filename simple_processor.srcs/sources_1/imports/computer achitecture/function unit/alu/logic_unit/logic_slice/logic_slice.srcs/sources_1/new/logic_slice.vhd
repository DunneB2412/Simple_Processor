----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 16:54:52
-- Design Name: 
-- Module Name: logic_slice - Behavioral
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

entity logic_slice is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           g : out STD_LOGIC);
end logic_slice;

architecture Behavioral of logic_slice is
    component mux_fxo 
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
    
    signal aNb,aUb,aRb,na: std_logic;
begin
    aNb <= a and b after 5ns;
    aUb <= a or b after 5ns;
    aRb <= a xor b after 5ns;
    na <= not(a) after 5ns;
    
    mux: mux_fxo port map(
        s => s,
        a => aNb,
        b => aUb,
        c => aRb,
        d => na,
        o => g
    );

end Behavioral;
