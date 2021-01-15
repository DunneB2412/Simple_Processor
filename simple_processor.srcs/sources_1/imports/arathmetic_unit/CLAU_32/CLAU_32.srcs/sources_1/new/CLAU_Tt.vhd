----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2021 19:23:25
-- Design Name: 
-- Module Name: CLAU_Tt - Behavioral
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

entity CLAU_Tt is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           ci : in STD_LOGIC;
           g : out STD_LOGIC_VECTOR (31 downto 0);
           co : out STD_LOGIC;
           v : out STD_LOGIC);
end CLAU_Tt;

architecture Behavioral of CLAU_Tt is

    component CLAU_f
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           ci : in STD_LOGIC;
           result: out STD_LOGIC_VECTOR (3 downto 0);
           co, v : out STD_LOGIC);
    end component;
    
    component mux_fxo is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
 
    signal ry,rg,rp,rc,rbc: STD_LOGIC_VECTOR (7 downto 0);
begin
    co <= rc(7);
    rbc(0) <= not(b(3))after 5ns;
    rbc(1) <= not(b(7))after 5ns;
    rbc(2) <= not(b(11))after 5ns;
    rbc(3) <= not(b(15))after 5ns;
    rbc(4) <= not(b(19))after 5ns;
    rbc(5) <= not(b(23))after 5ns;
    rbc(6) <= not(b(27))after 5ns;
    rbc(7) <= not(b(31))after 5ns;
    
    rg(0) <= a(0) and ry(0)after 5ns;
    rg(1) <= a(1) and ry(1)after 5ns;
    rg(2) <= a(2) and ry(2)after 5ns;
    rg(3) <= a(3) and ry(3)after 5ns;
    rg(4) <= a(4) and ry(4)after 5ns;
    rg(5) <= a(5) and ry(5)after 5ns;
    rg(6) <= a(6) and ry(6)after 5ns;
    rg(7) <= a(7) and ry(7)after 5ns;
    
    rp(0) <= a(0) xor ry(0)after 5ns;
    rp(1) <= a(1) xor ry(1)after 5ns;
    rp(2) <= a(2) xor ry(2)after 5ns;
    rp(3) <= a(3) xor ry(3)after 5ns;
    rp(4) <= a(4) xor ry(4)after 5ns;
    rp(5) <= a(5) xor ry(5)after 5ns;
    rp(6) <= a(6) xor ry(6)after 5ns;
    rp(7) <= a(7) xor ry(7)after 5ns;
    
    rc(0) <= rg(0)or(rp(0)and ci) after 5ns;
    rc(1) <= rg(1)or(rp(1)and(rg(0)or(rp(0)and ci)))after 5ns;
    rc(2) <= rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci)))))after 5ns;
    rc(3) <= rg(3)or(rp(3)and(rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci)))))))after 5ns;
    rc(4) <= rg(4)or(rp(4)and(rg(3)or(rp(3)and(rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci))))))))) after 5ns;
    rc(5) <= rg(5)or(rp(5)and(rg(4)or(rp(4)and(rg(3)or(rp(3)and(rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci))))))))))) after 5ns;
    rc(6) <= rg(6)or(rp(6)and(rg(5)or(rp(5)and(rg(4)or(rp(4)and(rg(3)or(rp(3)and(rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci))))))))))))) after 5ns;
    rc(7) <= rg(7)or(rp(7)and(rg(6)or(rp(6)and(rg(5)or(rp(5)and(rg(4)or(rp(4)and(rg(3)or(rp(3)and(rg(2)or(rp(2)and(rg(1)or(rp(1)and(rg(0)or(rp(0)and ci))))))))))))))) after 5ns;
    
    
    ry0: mux_fxo port map(
        s => s,
        a => '0',
        b => b(3),
        c => rbc(0),
        d => '1',
        o => ry(0)
    );
    ry1: mux_fxo port map(
        s => s,
        a => '0',
        b => b(7),
        c => rbc(1),
        d => '1',
        o => ry(1)
    );
    ry2: mux_fxo port map(
        s => s,
        a => '0',
        b => b(11),
        c => rbc(2),
        d => '1',
        o => ry(2)
    );
    ry3: mux_fxo port map(
        s => s,
        a => '0',
        b => b(15),
        c => rbc(3),
        d => '1',
        o => ry(3)
    );
    ry4: mux_fxo port map(
        s => s,
        a => '0',
        b => b(19),
        c => rbc(4),
        d => '1',
        o => ry(4)
    );
    ry5: mux_fxo port map(
        s => s,
        a => '0',
        b => b(23),
        c => rbc(5),
        d => '1',
        o => ry(5)
    );
    ry6: mux_fxo port map(
        s => s,
        a => '0',
        b => b(27),
        c => rbc(6),
        d => '1',
        o => ry(6)
    );
    ry7: mux_fxo port map(
        s => s,
        a => '0',
        b => b(31),
        c => rbc(7),
        d => '1',
        o => ry(7)
    );


    CLU0: CLAU_f port map(
        a => a(3 downto 0),
        b => b(3 downto 0),
        s => s,
        ci => ci,
        result => g(3 downto 0)
    );
    
     CLU1: CLAU_f port map(
        a => a(7 downto 4),
        b => b(7 downto 4),
        s => s,
        ci => rc(0),
        result => g(7 downto 4)
    );
    
     CLU2: CLAU_f port map(
        a => a(11 downto 8),
        b => b(11 downto 8),
        s => s,
        ci => rc(1),
        result => g(11 downto 8)
    );
    
     CLU3: CLAU_f port map(
        a => a(15 downto 12),
        b => b(15 downto 12),
        s => s,
        ci => rc(2),
        result => g(15 downto 12)
    );
    
     CLU4: CLAU_f port map(
        a => a(19 downto 16),
        b => b(19 downto 16),
        s => s,
        ci => rc(3),
        result => g(19 downto 16)
    );
    
     CLU5: CLAU_f port map(
        a => a(23 downto 20),
        b => b(23 downto 20),
        s => s,
        ci => rc(4),
        result => g(23 downto 20)
    );
    
     CLU6: CLAU_f port map(
        a => a(27 downto 24),
        b => b(27 downto 24),
        s => s,
        ci => rc(5),
        result => g(27 downto 24)
    );
    
     CLU7: CLAU_f port map(
        a => a(31 downto 28),
        b => b(31 downto 28),
        s => s,
        ci => rc(6),
        result => g(31 downto 28),
        v => v
    );
    
    

end Behavioral;
