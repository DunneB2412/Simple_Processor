----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 22:08:51
-- Design Name: 
-- Module Name: funcrional_unit_Tt - Behavioral
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

entity funcrional_unit_Tt is
    Port ( fs : in STD_LOGIC_VECTOR (4 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0);
           flags: out std_logic_vector (3 downto 0));
           
end funcrional_unit_Tt;

architecture Behavioral of funcrional_unit_Tt is

    component ALU_Tt
    Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           g : out STD_LOGIC_VECTOR (31 downto 0);
           co, v : out STD_LOGIC);
    end component;
    component shifter_Tt
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           d : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    component mux_txTt 
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    signal alu_g, shifter_g : STD_LOGIC_VECTOR (31 downto 0);
begin
    
    alu: ALU_Tt port map(
        s => fs(3 downto 0),
        a => a,
        b => b,
        g => alu_g,
        v => flags(3),
        co => flags(2)
    );
    shifter: shifter_Tt port map(
        s => fs(3 downto 2),
        d => b,
        o => shifter_g
    );
    mf_solect: mux_txTt port map(
        s => fs(4),
        a => alu_g,
        b => shifter_g,
        o => o
    );
    flags(1) <= alu_g(31);
    process(alu_g)begin
    if(alu_g = "00000000000000000000000000000000")
    then
        flags(0) <= '1';
    else
        flags(0) <= '0';
    end if;
    end process;
    
end Behavioral;
