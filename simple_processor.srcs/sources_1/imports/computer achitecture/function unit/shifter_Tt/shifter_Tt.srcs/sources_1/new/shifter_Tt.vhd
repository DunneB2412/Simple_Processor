----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2020 21:05:22
-- Design Name: 
-- Module Name: shifter_Tt - Behavioral
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

entity shifter_Tt is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           d : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
end shifter_Tt;

architecture Behavioral of shifter_Tt is
    component  mux_fxo 
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
begin

    mux0: mux_fxo port map(
        s => s,
        a => d(0),
        b => d(31),
        c => d(1),
        d => '0',
        o => o(0)
    );
     mux1: mux_fxo port map(
        s => s,
        a => d(1),
        b => d(0),
        c => d(2),
        d => '0',
        o => o(1)
    );
     mux2: mux_fxo port map(
        s => s,
        a => d(2),
        b => d(1),
        c => d(3),
        d => '0',
        o => o(2)
    );
     mux3: mux_fxo port map(
        s => s,
        a => d(3),
        b => d(2),
        c => d(4),
        d => '0',
        o => o(3)
    );
     mux4: mux_fxo port map(
        s => s,
        a => d(4),
        b => d(3),
        c => d(5),
        d => '0',
        o => o(4)
    );
     mux5: mux_fxo port map(
        s => s,
        a => d(5),
        b => d(4),
        c => d(6),
        d => '0',
        o => o(5)
    );
     mux6: mux_fxo port map(
        s => s,
        a => d(6),
        b => d(5),
        c => d(7),
        d => '0',
        o => o(6)
    );
     mux7: mux_fxo port map(
        s => s,
        a => d(7),
        b => d(6),
        c => d(8),
        d => '0',
        o => o(7)
    );
     mux8: mux_fxo port map(
        s => s,
        a => d(8),
        b => d(7),
        c => d(9),
        d => '0',
        o => o(8)
    );
     mux9: mux_fxo port map(
        s => s,
        a => d(9),
        b => d(8),
        c => d(10),
        d => '0',
        o => o(9)
    );
    
    mux10: mux_fxo port map(
        s => s,
        a => d(10),
        b => d(9),
        c => d(11),
        d => '0',
        o => o(10)
    );
     mux11: mux_fxo port map(
        s => s,
        a => d(11),
        b => d(10),
        c => d(12),
        d => '0',
        o => o(11)
    );
     mux12: mux_fxo port map(
        s => s,
        a => d(12),
        b => d(11),
        c => d(13),
        d => '0',
        o => o(12)
    );
     mux13: mux_fxo port map(
        s => s,
        a => d(13),
        b => d(12),
        c => d(14),
        d => '0',
        o => o(13)
    );
     mux14: mux_fxo port map(
        s => s,
        a => d(14),
        b => d(13),
        c => d(15),
        d => '0',
        o => o(14)
    );
     mux15: mux_fxo port map(
        s => s,
        a => d(15),
        b => d(14),
        c => d(16),
        d => '0',
        o => o(15)
    );
     mux16: mux_fxo port map(
        s => s,
        a => d(16),
        b => d(15),
        c => d(17),
        d => '0',
        o => o(16)
    );
     mux17: mux_fxo port map(
        s => s,
        a => d(17),
        b => d(16),
        c => d(18),
        d => '0',
        o => o(17)
    );
     mux18: mux_fxo port map(
        s => s,
        a => d(18),
        b => d(17),
        c => d(19),
        d => '0',
        o => o(18)
    );
     mux19: mux_fxo port map(
        s => s,
        a => d(19),
        b => d(18),
        c => d(20),
        d => '0',
        o => o(19)
    );
    
    mux20: mux_fxo port map(
        s => s,
        a => d(20),
        b => d(19),
        c => d(21),
        d => '0',
        o => o(20)
    );
     mux21: mux_fxo port map(
        s => s,
        a => d(21),
        b => d(20),
        c => d(22),
        d => '0',
        o => o(21)
    );
     mux22: mux_fxo port map(
        s => s,
        a => d(22),
        b => d(21),
        c => d(23),
        d => '0',
        o => o(22)
    );
     mux23: mux_fxo port map(
        s => s,
        a => d(23),
        b => d(22),
        c => d(24),
        d => '0',
        o => o(23)
    );
     mux24: mux_fxo port map(
        s => s,
        a => d(24),
        b => d(23),
        c => d(25),
        d => '0',
        o => o(24)
    );
     mux25: mux_fxo port map(
        s => s,
        a => d(25),
        b => d(24),
        c => d(26),
        d => '0',
        o => o(25)
    );
     mux26: mux_fxo port map(
        s => s,
        a => d(26),
        b => d(25),
        c => d(27),
        d => '0',
        o => o(26)
    );
     mux27: mux_fxo port map(
        s => s,
        a => d(27),
        b => d(26),
        c => d(28),
        d => '0',
        o => o(27)
    );
     mux28: mux_fxo port map(
        s => s,
        a => d(28),
        b => d(27),
        c => d(29),
        d => '0',
        o => o(28)
    );
     mux29: mux_fxo port map(
        s => s,
        a => d(29),
        b => d(28),
        c => d(30),
        d => '0',
        o => o(29)
    );
    mux30: mux_fxo port map(
        s => s,
        a => d(30),
        b => d(29),
        c => d(31),
        d => '0',
        o => o(30)
    );
    mux31: mux_fxo port map(
        s => s,
        a => d(31),
        b => d(30),
        c => d(0),
        d => '0',
        o => o(31)
    );

    
end Behavioral;
