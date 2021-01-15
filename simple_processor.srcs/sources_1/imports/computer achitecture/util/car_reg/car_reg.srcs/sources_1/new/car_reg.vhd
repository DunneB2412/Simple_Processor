----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2020 13:48:48
-- Design Name: 
-- Module Name: car_reg - Behavioral
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

entity car_reg is
    Port ( set : in STD_LOGIC_VECTOR (16 downto 0);
           clk, l, r: in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (16 downto 0));
end car_reg;

architecture Behavioral of car_reg is

    component CLAU_Tt --sub in cla
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           ci: in STD_LOGIC;
           co, v : out STD_LOGIC;
           g : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    component reg_oS 
    Port ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (16 downto 0);
           value : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    signal sum, current, nex: STD_LOGIC_VECTOR (16 downto 0);
    signal dump: STD_LOGIC_VECTOR (14 downto 0);
    signal r_load: STD_LOGIC:= '1';
    signal clk_5d: STD_LOGIC;
    
begin
    clk_5d <= clk after 5ns;

    increment: CLAU_Tt port map(
        s => "00",
        a(31 downto 17) => "000000000000000",
        a(16 downto 0) => current,
        b => "00000000000000000000000000000000",
        ci => '1',
        g(16 downto 0) => sum,
        g(31 downto 17) => dump
    );
    
    reg: reg_oS  port map(
        clk => clk_5d,
        load => r_load,
        input => nex,
        value => current   
    );
    value <= current;
    
    process(clk)begin
        if(r='0') then
            if(l='0')then 
                nex <= sum;-- after 5ns;
            else
                nex <= set;-- after 5ns;
            end if;
        else
            nex <= "00000000000000000";
        end if;
    end process;

end Behavioral;
