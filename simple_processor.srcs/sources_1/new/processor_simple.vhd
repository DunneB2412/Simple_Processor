----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 19:41:25
-- Design Name: 
-- Module Name: processor_simple - Behavioral
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

entity processor_simple is
    Port ( clk, reset : in STD_LOGIC);
end processor_simple;

architecture Behavioral of processor_simple is

    component data_path_TtxTt
    Port ( controll_word : in STD_LOGIC_VECTOR (25 downto 0);
           clk : in STD_LOGIC;
           constant_in, data_in : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0);
           address_out: out STD_LOGIC_VECTOR (31 downto 0);
           flags: out std_logic_vector(3 downto 0));
    end component;
    
    component controller
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           flags: in STD_LOGIC_VECTOR (3 downto 0);
           clk, reset: in STD_LOGIC;
           pc_address : out STD_LOGIC_VECTOR (31 downto 0);
           controll_word : out STD_LOGIC_VECTOR (25 downto 0);
           immediate : out STD_LOGIC_VECTOR (31 downto 0);
           flag_c : out STD_LOGIC_VECTOR (4 downto 0);
           mm_c: out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component flag_register 
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           FR : in STD_LOGIC_VECTOR (3 downto 0);
           load, clk : in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component mux_txTt
    port(s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           o : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component memory_memory
    Port ( address, data_in: in STD_LOGIC_VECTOR (31 downto 0); 
        write, clk: in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal immediate, data_address, pc_address, mm_address, data_DP, data_MM: STD_LOGIC_VECTOR (31 downto 0); 
    signal controll_word: STD_LOGIC_VECTOR (25 downto 0);
    signal flag_c, flag_cm: STD_LOGIC_VECTOR (4 downto 0);
    signal fv, fd: STD_LOGIC_VECTOR (3 downto 0);
    signal memory_c:  STD_LOGIC_VECTOR (1 downto 0);
    signal clk_5d , clk_55d: STD_LOGIC;

begin
    clk_5d <= clk after 5ns;
    clk_55d <= clk after 55ns;

    data_path: data_path_TtxTt port map(
        controll_word => controll_word,
        clk => clk,--_55d, -- acomidate controll delay
        constant_in => immediate,
        data_in => data_MM,
        data_out => data_DP,
        address_out => data_address,
        flags => fd
    );
    
    controll: controller port map(
        instruction => data_MM,
        flags => fv,
        clk => clk_5d, -- pioratise registering flags from previous operation
        reset => reset,
        pc_address => pc_address,
        controll_word => controll_word,
        immediate => immediate,
        flag_c => flag_cm,
        mm_c => memory_c
    );
    
    memory: memory_memory port map(
        address => mm_address,
        data_in => data_DP,
        write => memory_c(0),
        clk => clk_5d, -- pioratise registering flags from previous operation.. not shure why this is clocked but
        data_out => data_MM
    );
    
    process(reset, flag_cm)begin
        if(reset ='1')then
            flag_c <= "11111";
        else
            flag_c <= flag_cm;
        end if;
    end process;
    flags: flag_register port map(
        input => fd,
        FR => flag_c(4 downto 1),
        load => flag_c(0),
        clk => clk,
        value => fv
    );
    
    mux_m: mux_txTt port map(
        s => memory_c(1),
        a => data_address,
        b => pc_address,
        o => mm_address
    );
    

end Behavioral;
