----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2020 19:53:20
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is -- 40 pd till in char loaded + 10 for rest
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           flags: in STD_LOGIC_VECTOR (3 downto 0);
           clk, reset: in STD_LOGIC;
           pc_address : out STD_LOGIC_VECTOR (31 downto 0);
           controll_word : out STD_LOGIC_VECTOR (25 downto 0);
           immediate : out STD_LOGIC_VECTOR (31 downto 0);
           flag_c : out STD_LOGIC_VECTOR (4 downto 0);
           mm_c: out STD_LOGIC_VECTOR (1 downto 0));
end controller;

architecture Behavioral of controller is

    component controll_memory
    Port ( IN_CAR : in STD_LOGIC_VECTOR (16 downto 0);
           flag_reset : out STD_LOGIC_VECTOR (4 downto 0);
           memory_c : out STD_LOGIC_VECTOR (1 downto 0);
           controll_base : out STD_LOGIC_VECTOR (10 downto 0);
           PC_c : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           MC : out STD_LOGIC;
           MS : out STD_LOGIC_VECTOR (2 downto 0);
           alt_address : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    component regTt
    Port ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           value : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component mux_exo 
    Port ( s : in STD_LOGIC_VECTOR (2 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           e : in STD_LOGIC;
           f : in STD_LOGIC;
           g : in STD_LOGIC;
           h : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
    
    component car_reg
    Port ( set : in STD_LOGIC_VECTOR (16 downto 0);
           clk, l, r: in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    component mux_txoS
    Port ( s : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (16 downto 0);
           b : in STD_LOGIC_VECTOR (16 downto 0);
           o : out STD_LOGIC_VECTOR (16 downto 0));
    end component;
    
    component PC
    Port ( offset : in STD_LOGIC_VECTOR (31 downto 0);
           clk, pi, pl: in STD_LOGIC;
           value : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal pc_e, ir_val: STD_LOGIC_VECTOR (31 downto 0);
    signal m_car, r_car, op_car, n_car:  STD_LOGIC_VECTOR (16 downto 0);
    signal controll_base: STD_LOGIC_VECTOR (10 downto 0);
    signal pc_e_base: STD_LOGIC_VECTOR (9 downto 0);
    signal ms: STD_LOGIC_VECTOR (2 downto 0);
    signal pc_c, pc_cm: STD_LOGIC_VECTOR (1 downto 0);
    signal l_car_r, zc, cc, il, mc, clk_20d, clk_30d: STD_LOGIC;
begin

    memory: controll_memory port map(
        IN_CAR => m_car, 
        flag_reset  => flag_c,
        memory_c => mm_c,
        controll_base => controll_base,
        PC_c => pc_cm,
        IL => il,
        MC => mc,
        MS => ms,
        alt_address  => n_car
    );
    controll_word(25 downto 23) <= controll_base(10 downto 8);
    controll_word(7 downto 0) <= controll_base(7 downto 0);
    
    
    car_r: car_reg port map(
        clk => clk_30d,
        l => l_car_r,
        r => '0',
        set => r_car,
        value => m_car
    );
    clk_30d <= clk after 30ns; --acomidating the delay of data to be loaded
    
    mux_c: mux_txoS port map(
        s => mc,
        a => n_car,
        b => op_car,
        o => r_car
    );
    
    ir: regTt port map(
        clk => clk_20d,
        load => il,
        input => instruction,
        value => ir_val
    );
    clk_20d <= clk after 20ns; --acomidating the delay of instruction fetch to be loaded
    controll_word(12 downto 8)  <= ir_val(4 downto 0);
    controll_word(17 downto 13) <= ir_val(9 downto 5);
    controll_word(22 downto 18) <= ir_val(14 downto 10);
    op_car <= ir_val(31 downto 15);
    pc_e_base(9 downto 5) <= ir_val(14 downto 10);
    pc_e_base(4 downto 0) <= ir_val(4 downto 0);
    
    
    mux_s: mux_exo port map(
        s => ms,
        a => '0',
        b => '1',
        c => flags(2),
        d => flags(3),
        e => flags(0),
        f => flags(1),
        g => cc,
        h => zc,
        o => l_car_r
    );
    cc <= not(flags(2));
    zc <= not(flags(0));
    
    process(reset, pc_cm) begin
        if(reset = '1') then
            pc_c <= "00";
        else
            pc_c <= pc_cm;
        end if;
    end process;
    program_counter: PC port map(
        offset => pc_e,
        clk => clk,
        pl => pc_c(0),
        pi => pc_c(1),
        value => pc_address
    );
    
    process(pc_e_base) begin -- thise honistly seem a little silly and i suppose is just needed for first part
        if(pc_e_base(9)='0')then
            pc_e(31 downto 10) <= "0000000000000000000000"after 5ns; 
        else
            pc_e(31 downto 10) <= "1111111111111111111111"after 5ns; 
        end if;
        pc_e(9 downto 0) <= pc_e_base after 5ns;
        immediate(31 downto 5) <= "000000000000000000000000000"after 5ns;
        immediate(4 downto 0) <= ir_val(4 downto 0)after 5ns;
    end process;
    
end Behavioral;
