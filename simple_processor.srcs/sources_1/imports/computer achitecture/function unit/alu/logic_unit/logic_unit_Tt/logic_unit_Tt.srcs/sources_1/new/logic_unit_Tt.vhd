----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 19:34:16
-- Design Name: 
-- Module Name: logic_unit_Tt - Behavioral
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

entity logic_unit_Tt is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           g : out STD_LOGIC_VECTOR (31 downto 0));
end logic_unit_Tt;

architecture Behavioral of logic_unit_Tt is
    component logic_slice
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           g : out STD_LOGIC);
    end component;
    
    signal outs: STD_LOGIC_VECTOR (31 downto 0);
begin

    logic_slice0: logic_slice port map(
        s => s,
        a => a(0),
        b => b(0),
        g => g(0)
    );
    logic_slice1: logic_slice port map(
        s => s,
        a => a(1),
        b => b(1),
        g => g(1)
    );
    logic_slice2: logic_slice port map(
        s => s,
        a => a(2),
        b => b(2),
        g => g(2)
    );
    logic_slice3: logic_slice port map(
        s => s,
        a => a(3),
        b => b(3),
        g => g(3)
    );
    logic_slice4: logic_slice port map(
        s => s,
        a => a(4),
        b => b(4),
        g => g(4)
    );
    logic_slice5: logic_slice port map(
        s => s,
        a => a(5),
        b => b(5),
        g => g(5)
    );
    logic_slice6: logic_slice port map(
        s => s,
        a => a(6),
        b => b(6),
        g => g(6)
    );
    logic_slice7: logic_slice port map(
        s => s,
        a => a(7),
        b => b(7),
        g => g(7)
    );
    logic_slice8: logic_slice port map(
        s => s,
        a => a(8),
        b => b(8),
        g => g(8)
    );
    logic_slice9: logic_slice port map(
        s => s,
        a => a(9),
        b => b(9),
        g => g(9)
    );
    logic_slice10: logic_slice port map(
        s => s,
        a => a(10),
        b => b(10),
        g => g(10)
    );
    logic_slice11: logic_slice port map(
        s => s,
        a => a(11),
        b => b(11),
        g => g(11)
    );
    logic_slice12: logic_slice port map(
        s => s,
        a => a(12),
        b => b(12),
        g => g(12)
    );
    logic_slice13: logic_slice port map(
        s => s,
        a => a(13),
        b => b(13),
        g => g(13)
    );
    logic_slice14: logic_slice port map(
        s => s,
        a => a(14),
        b => b(14),
        g => g(14)
    );
    logic_slice15: logic_slice port map(
        s => s,
        a => a(15),
        b => b(15),
        g => g(15)
    );
    logic_slice16: logic_slice port map(
        s => s,
        a => a(16),
        b => b(16),
        g => g(16)
    );
    logic_slice17: logic_slice port map(
        s => s,
        a => a(17),
        b => b(17),
        g => g(17)
    );
    logic_slice18: logic_slice port map(
        s => s,
        a => a(18),
        b => b(18),
        g => g(18)
    );
    logic_slice19: logic_slice port map(
        s => s,
        a => a(19),
        b => b(19),
        g => g(19)
    );
    logic_slice20: logic_slice port map(
        s => s,
        a => a(20),
        b => b(20),
        g => g(20)
    );
    logic_slice21: logic_slice port map(
        s => s,
        a => a(21),
        b => b(21),
        g => g(21)
    );
    logic_slice22: logic_slice port map(
        s => s,
        a => a(22),
        b => b(22),
        g => g(22)
    );
    logic_slice23: logic_slice port map(
        s => s,
        a => a(23),
        b => b(23),
        g => g(23)
    );
    logic_slice24: logic_slice port map(
        s => s,
        a => a(24),
        b => b(24),
        g => g(24)
    );
    logic_slice25: logic_slice port map(
        s => s,
        a => a(25),
        b => b(25),
        g => g(25)
    );
    logic_slice26: logic_slice port map(
        s => s,
        a => a(26),
        b => b(26),
        g => g(26)
    );
    logic_slice27: logic_slice port map(
        s => s,
        a => a(27),
        b => b(27),
        g => g(27)
    );
    logic_slice28: logic_slice port map(
        s => s,
        a => a(28),
        b => b(28),
        g => g(28)
    );
    logic_slice29: logic_slice port map(
        s => s,
        a => a(29),
        b => b(29),
        g => g(29)
    );
    logic_slice30: logic_slice port map(
        s => s,
        a => a(30),
        b => b(30),
        g => g(30)
    );
    logic_slice31: logic_slice port map(
        s => s,
        a => a(31),
        b => b(31),
        g => g(31)
    );
    
end Behavioral;
