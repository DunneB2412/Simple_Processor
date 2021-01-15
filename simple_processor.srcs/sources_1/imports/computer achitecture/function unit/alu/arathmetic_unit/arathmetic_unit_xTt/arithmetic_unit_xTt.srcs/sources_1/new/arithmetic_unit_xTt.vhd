----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 00:06:51
-- Design Name: 
-- Module Name: arithmetic_unit_xTt - Behavioral
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

entity arithmetic_unit_xTt is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           ci: in STD_LOGIC;
           co, v : out STD_LOGIC;
           g : out STD_LOGIC_VECTOR (31 downto 0));
end arithmetic_unit_xTt;

architecture Behavioral of arithmetic_unit_xTt is

    component arithmetic_slice
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           co : out STD_LOGIC;
           g : out STD_LOGIC);
    end component;

    signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,
    c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32: std_logic;
begin
    
    
    
    slice0: arithmetic_slice port map(
        s => s,
        a => a(0),
        b => b(0),
        ci => ci,
        co => c1,
        g => g(0)
    );
    slice1: arithmetic_slice port map(
        s => s,
        a => a(1),
        b => b(1),
        ci => c1,
        co => c2,
        g => g(1)
    );
    slice2: arithmetic_slice port map(
        s => s,
        a => a(2),
        b => b(2),
        ci => c2,
        co => c3,
        g => g(2)
    );
    slice3: arithmetic_slice port map(
        s => s,
        a => a(3),
        b => b(3),
        ci => c3,
        co => c4,
        g => g(3)
    );
    slice4: arithmetic_slice port map(
        s => s,
        a => a(4),
        b => b(4),
        ci => c4,
        co => c5,
        g => g(4)
    );
    slice5: arithmetic_slice port map(
        s => s,
        a => a(5),
        b => b(5),
        ci => c5,
        co => c6,
        g => g(5)
    );
    slice6: arithmetic_slice port map(
        s => s,
        a => a(6),
        b => b(6),
        ci => c6,
        co => c7,
        g => g(6)
    );
    slice7: arithmetic_slice port map(
        s => s,
        a => a(7),
        b => b(7),
        ci => c7,
        co => c8,
        g => g(7)
    );
    slice8: arithmetic_slice port map(
        s => s,
        a => a(8),
        b => b(8),
        ci => c8,
        co => c9,
        g => g(8)
    );
    slice9: arithmetic_slice port map(
        s => s,
        a => a(9),
        b => b(9),
        ci => c9,
        co => c10,
        g => g(9)
    );
    slice10: arithmetic_slice port map(
        s => s,
        a => a(10),
        b => b(10),
        ci => c10,
        co => c11,
        g => g(10)
    );
    slice11: arithmetic_slice port map(
        s => s,
        a => a(11),
        b => b(11),
        ci => c11,
        co => c12,
        g => g(11)
    );
    slice12: arithmetic_slice port map(
        s => s,
        a => a(12),
        b => b(12),
        ci => c12,
        co => c13,
        g => g(12)
    );
    slice13: arithmetic_slice port map(
        s => s,
        a => a(13),
        b => b(13),
        ci => c13,
        co => c14,
        g => g(13)
    );
    slice14: arithmetic_slice port map(
        s => s,
        a => a(14),
        b => b(14),
        ci => c14,
        co => c15,
        g => g(14)
    );
    slice15: arithmetic_slice port map(
        s => s,
        a => a(15),
        b => b(15),
        ci => c15,
        co => c16,
        g => g(15)
    );
    slice16: arithmetic_slice port map(
        s => s,
        a => a(16),
        b => b(16),
        ci => c16,
        co => c17,
        g => g(16)
    );
    slice17: arithmetic_slice port map(
        s => s,
        a => a(17),
        b => b(17),
        ci => c17,
        co => c18,
        g => g(17)
    );
    slice18: arithmetic_slice port map(
        s => s,
        a => a(18),
        b => b(18),
        ci => c18,
        co => c19,
        g => g(18)
    );
    slice19: arithmetic_slice port map(
        s => s,
        a => a(19),
        b => b(19),
        ci => c19,
        co => c20,
        g => g(19)
    );
    slice20: arithmetic_slice port map(
        s => s,
        a => a(20),
        b => b(20),
        ci => c20,
        co => c21,
        g => g(20)
    );
    slice21: arithmetic_slice port map(
        s => s,
        a => a(21),
        b => b(21),
        ci => c21,
        co => c22,
        g => g(21)
    );
    slice22: arithmetic_slice port map(
        s => s,
        a => a(22),
        b => b(22),
        ci => c22,
        co => c23,
        g => g(22)
    );
    slice23: arithmetic_slice port map(
        s => s,
        a => a(23),
        b => b(23),
        ci => c23,
        co => c24,
        g => g(23)
    );
    slice24: arithmetic_slice port map(
        s => s,
        a => a(24),
        b => b(24),
        ci => c24,
        co => c25,
        g => g(24)
    );
    slice25: arithmetic_slice port map(
        s => s,
        a => a(25),
        b => b(25),
        ci => c25,
        co => c26,
        g => g(25)
    );
    slice26: arithmetic_slice port map(
        s => s,
        a => a(26),
        b => b(26),
        ci => c26,
        co => c27,
        g => g(26)
    );
    slice27: arithmetic_slice port map(
        s => s,
        a => a(27),
        b => b(27),
        ci => c27,
        co => c28,
        g => g(27)
    );
    slice28: arithmetic_slice port map(
        s => s,
        a => a(28),
        b => b(28),
        ci => c28,
        co => c29,
        g => g(28)
    );
    slice29: arithmetic_slice port map(
        s => s,
        a => a(29),
        b => b(29),
        ci => c29,
        co => c30,
        g => g(29)
    );
    slice30: arithmetic_slice port map(
        s => s,
        a => a(30),
        b => b(30),
        ci => c30,
        co => c31,
        g => g(30)
    );
    slice31: arithmetic_slice port map(
        s => s,
        a => a(31),
        b => b(31),
        ci => c31,
        co => c32,
        g => g(31)
    );
    co <= c32;
    v <= c31 and c32 after 5ns;

end Behavioral;
