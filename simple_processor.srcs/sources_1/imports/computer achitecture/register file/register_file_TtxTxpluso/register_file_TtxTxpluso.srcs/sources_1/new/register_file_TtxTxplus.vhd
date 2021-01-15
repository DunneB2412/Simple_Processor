----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2020 22:38:39
-- Design Name: 
-- Module Name: register_file_TtxTxplus - Behavioral
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
--this is designed to rap 2 register banks together using an aditional bit. 
--in our case we only need one aditional register
entity register_file_TtxTxplus is 
Port (  src_a, src_b, dest : in STD_LOGIC_VECTOR (4 downto 0);
        t_a, t_b, t_d: in STD_LOGIC; --aditional adressing bits
        clk : in STD_LOGIC;
        e : in STD_LOGIC;
        data : in STD_LOGIC_VECTOR (31 downto 0);
        a,b : out STD_LOGIC_VECTOR (31 downto 0));
end register_file_TtxTxplus;

architecture Behavioral of register_file_TtxTxplus is
    
    component regTt 
    Port ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           value : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component mux_txTt 
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component register_file_TtxTt_ab 
    Port (  src_a, src_b, dest : in STD_LOGIC_VECTOR (4 downto 0);
        clk : in STD_LOGIC;
        e : in STD_LOGIC;
        data : in STD_LOGIC_VECTOR (31 downto 0);
        a,b : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal a1, b1, ab2: STD_LOGIC_VECTOR (31 downto 0);
    signal e1, e2: STD_LOGIC;

begin

    registers1: register_file_TtxTt_ab port map( --declaring register banks
        src_a => src_a,
        src_b => src_b,
        dest => dest,
        clk => clk,
        e => e1,
        data => data,
        a => a1,
        b => b1        
    );
    temp_registers: regTt port map(
        clk => clk,
        load => e2,
        input => data,
        value => ab2
    );
    
    a_mux: mux_txTt port map( --desiding which register bank to read from for a and b bus
        s => t_a,
        a => a1,
        b => ab2,
        o => a
    );
    b_mux: mux_txTt port map(
        s => t_b,
        a => b1,
        b => ab2,
        o => b
    );
    
    e1 <= e and not(t_d);
    e2 <= e and t_d;

end Behavioral;
