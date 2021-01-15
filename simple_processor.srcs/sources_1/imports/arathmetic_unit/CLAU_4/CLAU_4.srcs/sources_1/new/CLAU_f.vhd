----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2021 18:14:14
-- Design Name: 
-- Module Name: CLAU_f - Behavioral
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

entity CLAU_f is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           ci : in STD_LOGIC;
           result: out STD_LOGIC_VECTOR (3 downto 0);
           co, v : out STD_LOGIC);
end CLAU_f;

architecture Behavioral of CLAU_f is

    component mux_fxo is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
    
    signal y, bc, g, p, c: STD_LOGIC_VECTOR (3 downto 0);
begin
    bc(0) <= not(b(0))after 5ns;
    bc(1) <= not(b(1))after 5ns;
    bc(2) <= not(b(2))after 5ns;
    bc(3) <= not(b(3))after 5ns;
    y0: mux_fxo port map(
        s => s,
        a => '0',
        b => b(0),
        c => bc(0),
        d => '1',
        o => y(0)
    );
    y1: mux_fxo port map(
        s => s,
        a => '0',
        b => b(1),
        c => bc(1),
        d => '1',
        o => y(1)
    );
    y2: mux_fxo port map(
        s => s,
        a => '0',
        b => b(2),
        c => bc(2),
        d => '1',
        o => y(2)
    );
    y3: mux_fxo port map(
        s => s,
        a => '0',
        b => b(3),
        c => bc(3),
        d => '1',
        o => y(3)
    );
    g(0) <= a(0) and y(0)after 5ns;
    g(1) <= a(1) and y(1)after 5ns;
    g(2) <= a(2) and y(2)after 5ns;
    g(3) <= a(3) and y(3)after 5ns;
    p(0) <= a(0) xor y(0)after 5ns;
    p(1) <= a(1) xor y(1)after 5ns;
    p(2) <= a(2) xor y(2)after 5ns;
    p(3) <= a(3) xor y(3)after 5ns;
    
    c(0) <= g(0) or (p(0) and ci) after 5ns;
    c(1) <= g(1) or (p(1) and (g(0) or (p(0) and ci)))after 5ns;
    c(2) <= g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and ci)))))after 5ns;
    c(3) <= g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and ci)))))))after 5ns;
    
    result(0) <= (a(0) xor y(0)) xor ci after 5ns; 
    result(1) <= (a(1) xor y(1)) xor c(0)after 5ns; 
    result(2) <= (a(2) xor y(2)) xor c(1)after 5ns; 
    result(3) <= (a(3) xor y(3)) xor c(2)after 5ns; 
    co <= c(3)after 5ns;
    v <= c(2) and c(3);

end Behavioral;
