----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 14:04:03
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( offset : in STD_LOGIC_VECTOR (31 downto 0);
           clk, pi, pl: in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

    component regTt Port 
        ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           value : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component CLAU_Tt --sub in cla
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           ci : in STD_LOGIC;
           co, v : out STD_LOGIC;
           g : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal sum, current, nex: STD_LOGIC_VECTOR (31 downto 0);
    signal r_load: STD_LOGIC:= '1';
    signal clk_5d: STD_LOGIC;
    
begin
    clk_5d <= clk after 5ns;
    adder: CLAU_Tt port map(
        s(0) => pl,
        s(1) => '0',
        a => current,
        b => offset,
        ci => pi,
        g => sum
    );
    
    reg: regTt port map(
        clk => clk_5d,
        load => r_load,
        input => nex,
        value => current   
    );
    value <= current;
    
    process(sum, pl, pi)begin
        if((pl and pi)='1')then    -- 11 meand wait
            nex <= current;-- after 5ns;
        elsif((pl xor pi)='1')then -- 10 or 01 returns the result of the add, else reset
            nex <= sum;-- after 5ns;
        else                       --else (00) reset
            nex <= "00000000000000000000000000000000";-- after 5ns;
        end if;
    end process;

end Behavioral;