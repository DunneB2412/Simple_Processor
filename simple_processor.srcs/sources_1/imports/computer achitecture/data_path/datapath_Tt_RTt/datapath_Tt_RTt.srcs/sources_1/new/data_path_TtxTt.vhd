----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2020 19:28:59
-- Design Name: 
-- Module Name: data_path_TtxTt - Behavioral
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

entity data_path_TtxTt is
    Port ( controll_word : in STD_LOGIC_VECTOR (25 downto 0);
           clk : in STD_LOGIC;
           constant_in, data_in : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0);
           address_out: out STD_LOGIC_VECTOR (31 downto 0);
           flags: out std_logic_vector(3 downto 0));
end data_path_TtxTt;

architecture Behavioral of data_path_TtxTt is

    component register_file_TtxTxplus 
    Port (  src_a, src_b, dest : in STD_LOGIC_VECTOR (4 downto 0);
        t_a, t_b, t_d: in STD_LOGIC; --aditional adressing bits
        clk : in STD_LOGIC;
        e : in STD_LOGIC;
        data : in STD_LOGIC_VECTOR (31 downto 0);
        a,b : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component funcrional_unit_Tt
    Port ( fs : in STD_LOGIC_VECTOR (4 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0);
           flags: out std_logic_vector (3 downto 0));
    end component;
    
    component mux_txTt 
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    
    signal bus_a, bus_b, bus_di, bus_bc, bus_d: std_logic_vector(31 downto 0);
begin

    register_file: register_file_TtxTxplus port map(
        src_a => controll_word(17 downto 13),
        src_b => controll_word(12 downto 8),
        dest => controll_word(22 downto 18),
        t_b => controll_word(23),
        t_a => controll_word(24), 
        t_d => controll_word(25),
        clk => clk,
        e => controll_word(0),
        data => bus_di,
        a => bus_a,
        b => bus_b
    );
    
    mux_b_cin: mux_txTt port map(
        s => controll_word(7),
        a => bus_b,
        b => constant_in,
        o => bus_bc
    );
    
    function_unit: funcrional_unit_Tt port map(
        fs => controll_word(6 downto 2),
        a => bus_a,
        b => bus_bc,
        o => bus_d,
        flags => flags
    );
    
    mux_d_din: mux_txTt port map(
        s => controll_word(1),
        a => bus_d,
        b => data_in,
        o => bus_di
    );
    address_out <= bus_a;
    data_out <= bus_bc;

end Behavioral;
