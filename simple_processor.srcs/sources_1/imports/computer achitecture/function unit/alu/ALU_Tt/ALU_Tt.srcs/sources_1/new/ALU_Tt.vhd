----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 20:09:15
-- Design Name: 
-- Module Name: ALU_Tt - Behavioral
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

entity ALU_Tt is
    Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           g : out STD_LOGIC_VECTOR (31 downto 0);
           co, v : out STD_LOGIC);
end ALU_Tt;

architecture Behavioral of ALU_Tt is
    component CLAU_Tt -- sub in clu
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           ci : in STD_LOGIC;
           co, v : out STD_LOGIC;
            g : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    component logic_unit_Tt
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           g : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    component mux_txTt 
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal gA, gL: STD_LOGIC_VECTOR (31 downto 0);
begin
    
    arathmitic_unit: CLAU_Tt port map(
        s => s(2 downto 1),
        a => a,
        b => b,
        ci => s(0),
        co => co,
        v => v,
        g => gA
    );
    logic_unit: logic_unit_Tt port map(
        s => s(2 downto 1),
        a => a,
        b => b,
        g => gL
    );
    mux_solect: mux_txTt port map(
        s => s(3),
        a => gA,
        b => gL,
        o => g
    );

end Behavioral; 
