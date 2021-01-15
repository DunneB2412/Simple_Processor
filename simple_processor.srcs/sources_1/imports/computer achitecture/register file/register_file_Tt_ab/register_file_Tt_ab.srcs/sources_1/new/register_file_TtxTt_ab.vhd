----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2020 15:13:37
-- Design Name: 
-- Module Name: register_file_TtxTt_ab - Behavioral
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

entity register_file_TtxTt_ab is
Port (  src_a, src_b, dest : in STD_LOGIC_VECTOR (4 downto 0);
        clk : in STD_LOGIC;
        e : in STD_LOGIC;
        data : in STD_LOGIC_VECTOR (31 downto 0);
        a,b : out STD_LOGIC_VECTOR (31 downto 0));
end register_file_TtxTt_ab;

architecture Behavioral of register_file_TtxTt_ab is

    component regTt 
    Port ( clk : in STD_LOGIC;
           load : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           value : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component mux_TTxTT
    Port ( sig : in STD_LOGIC_VECTOR (4 downto 0);
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           c : in STD_LOGIC_VECTOR (31 downto 0);
           d : in STD_LOGIC_VECTOR (31 downto 0);
           e : in STD_LOGIC_VECTOR (31 downto 0);
           f : in STD_LOGIC_VECTOR (31 downto 0);
           g : in STD_LOGIC_VECTOR (31 downto 0);
           h : in STD_LOGIC_VECTOR (31 downto 0);
           i : in STD_LOGIC_VECTOR (31 downto 0);
           j : in STD_LOGIC_VECTOR (31 downto 0);
           k : in STD_LOGIC_VECTOR (31 downto 0);
           l : in STD_LOGIC_VECTOR (31 downto 0);
           m : in STD_LOGIC_VECTOR (31 downto 0);
           n : in STD_LOGIC_VECTOR (31 downto 0);
           o : in STD_LOGIC_VECTOR (31 downto 0);
           p : in STD_LOGIC_VECTOR (31 downto 0);
           q : in STD_LOGIC_VECTOR (31 downto 0);
           r : in STD_LOGIC_VECTOR (31 downto 0);
           s : in STD_LOGIC_VECTOR (31 downto 0);
           t : in STD_LOGIC_VECTOR (31 downto 0);
           u : in STD_LOGIC_VECTOR (31 downto 0);
           v : in STD_LOGIC_VECTOR (31 downto 0);
           w : in STD_LOGIC_VECTOR (31 downto 0);
           x : in STD_LOGIC_VECTOR (31 downto 0);
           y : in STD_LOGIC_VECTOR (31 downto 0);
           z : in STD_LOGIC_VECTOR (31 downto 0);
           aa : in STD_LOGIC_VECTOR (31 downto 0);
           ab : in STD_LOGIC_VECTOR (31 downto 0);
           ac : in STD_LOGIC_VECTOR (31 downto 0);
           ad : in STD_LOGIC_VECTOR (31 downto 0);
           ae : in STD_LOGIC_VECTOR (31 downto 0);
           af : in STD_LOGIC_VECTOR (31 downto 0);
           ou : out STD_LOGIC_VECTOR (31 downto 0));         
    end component;
    
    component dec_Tt is
    Port ( sig : in STD_LOGIC_VECTOR (4 downto 0);
           a : out STD_LOGIC;
           b : out STD_LOGIC;
           c : out STD_LOGIC;
           d : out STD_LOGIC;
           e : out STD_LOGIC;
           f : out STD_LOGIC;
           g : out STD_LOGIC;
           h : out STD_LOGIC;
           i : out STD_LOGIC;
           j : out STD_LOGIC;
           k : out STD_LOGIC;
           l : out STD_LOGIC;
           m : out STD_LOGIC;
           n : out STD_LOGIC;
           o : out STD_LOGIC;
           p : out STD_LOGIC;
           q : out STD_LOGIC;
           r : out STD_LOGIC;
           s : out STD_LOGIC;
           t : out STD_LOGIC;
           u : out STD_LOGIC;
           v : out STD_LOGIC;
           w : out STD_LOGIC;
           x : out STD_LOGIC;
           y : out STD_LOGIC;
           z : out STD_LOGIC;
           aa : out STD_LOGIC;
           ab : out STD_LOGIC;
           ac : out STD_LOGIC;
           ad : out STD_LOGIC;
           ae : out STD_LOGIC;
           af : out STD_LOGIC);
    end component;
    -- signals
    signal lr0, lr1, lr2, lr3, lr4, lr5, lr6, lr7, lr8, lr9, lr10, lr11, lr12, lr13, lr14, lr15, lr16,
     lr17, lr18, lr19, lr20, lr21, lr22, lr23, lr24, lr25, lr26, lr27, lr28, lr29, lr30, lr31,
     ls0, ls1, ls2, ls3, ls4, ls5, ls6, ls7, ls8, ls9, ls10, ls11, ls12, ls13, ls14, ls15, ls16,
     ls17, ls18, ls19, ls20, ls21, ls22, ls23, ls24, ls25, ls26, ls27, ls28, ls29, ls30, ls31: std_logic;
    signal qr0, qr1, qr2, qr3, qr4, qr5, qr6, qr7, qr8, qr9, qr10, qr11, qr12, qr13, qr14, qr15, qr16,
     qr17, qr18, qr19, qr20, qr21, qr22, qr23, qr24, qr25, qr26, qr27, qr28, qr29, qr30, qr31: std_logic_vector(31 downto 0);
begin
    lr0 <= ls0 and e after 5ns;
    lr1 <= ls1 and e after 5ns;
    lr2 <= ls2 and e after 5ns;
    lr3 <= ls3 and e after 5ns;
    lr4 <= ls4 and e after 5ns;
    lr5 <= ls5 and e after 5ns;
    lr6 <= ls6 and e after 5ns;
    lr7 <= ls7 and e after 5ns;
    lr8 <= ls8 and e after 5ns;
    lr9 <= ls9 and e after 5ns;
    lr10 <= ls10 and e after 5ns;
    lr11 <= ls11 and e after 5ns;
    lr12 <= ls12 and e after 5ns;
    lr13 <= ls13 and e after 5ns;
    lr14 <= ls14 and e after 5ns;
    lr15 <= ls15 and e after 5ns;
    lr16 <= ls16 and e after 5ns;
    lr17 <= ls17 and e after 5ns;
    lr18 <= ls18 and e after 5ns;
    lr19 <= ls19 and e after 5ns;
    lr20 <= ls20 and e after 5ns;
    lr21 <= ls21 and e after 5ns;
    lr22 <= ls22 and e after 5ns;
    lr23 <= ls23 and e after 5ns;
    lr24 <= ls24 and e after 5ns;
    lr25 <= ls25 and e after 5ns;
    lr26 <= ls26 and e after 5ns;
    lr27 <= ls27 and e after 5ns;
    lr28 <= ls28 and e after 5ns;
    lr29 <= ls29 and e after 5ns;
    lr30 <= ls30 and e after 5ns;
    lr31 <= ls31 and e after 5ns;
    
    reg00: regTt port map(
        clk => clk,
        load => lr0,
        input => data,
        value => qr0
    );
 
    reg01: regTt port map(
        clk => clk,
        load => lr1,
        input => data,
        value => qr1
    );
    
    reg02: regTt port map(
        clk => clk,
        load => lr2,
        input => data,
        value => qr2
    );
    
    reg03: regTt port map(
        clk => clk,
        load => lr3,
        input => data,
        value => qr3
    );
    
    reg04: regTt port map(
        clk => clk,
        load => lr4,
        input => data,
        value => qr4
    );
    
    reg05: regTt port map(
        clk => clk,
        load => lr5,
        input => data,
        value => qr5
    );
    
    reg06: regTt port map(
        clk => clk,
        load => lr6,
        input => data,
        value => qr6
    );
    
    reg07: regTt port map(
        clk => clk,
        load => lr7,
        input => data,
        value => qr7
    );
    
    reg08: regTt port map(
        clk => clk,
        load => lr8,
        input => data,
        value => qr8
    );
    
    reg09: regTt port map(
        clk => clk,
        load => lr9,
        input => data,
        value => qr9
    );
    
    reg10: regTt port map(
        clk => clk,
        load => lr10,
        input => data,
        value => qr10
    );
    
    reg11: regTt port map(
        clk => clk,
        load => lr11,
        input => data,
        value => qr11
    );
    
    reg12: regTt port map(
        clk => clk,
        load => lr12,
        input => data,
        value => qr12
    );
    
    reg13: regTt port map(
        clk => clk,
        load => lr13,
        input => data,
        value => qr13
    );
    
    reg14: regTt port map(
        clk => clk,
        load => lr14,
        input => data,
        value => qr14
    );
    
    reg15: regTt port map(
        clk => clk,
        load => lr15,
        input => data,
        value => qr15
    );
    
    reg16: regTt port map(
        clk => clk,
        load => lr16,
        input => data,
        value => qr16
    );
    
    reg17: regTt port map(
        clk => clk,
        load => lr17,
        input => data,
        value => qr17
    );
    
    reg18: regTt port map(
        clk => clk,
        load => lr18,
        input => data,
        value => qr18
    );
    
    reg19: regTt port map(
        clk => clk,
        load => lr19,
        input => data,
        value => qr19
    );
    
    reg20: regTt port map(
        clk => clk,
        load => lr20,
        input => data,
        value => qr20
    );
    
    reg21: regTt port map(
        clk => clk,
        load => lr21,
        input => data,
        value => qr21
    );
    
    reg22: regTt port map(
        clk => clk,
        load => lr22,
        input => data,
        value => qr22
    );
    
    reg23: regTt port map(
        clk => clk,
        load => lr23,
        input => data,
        value => qr23
    );
    
    reg24: regTt port map(
        clk => clk,
        load => lr24,
        input => data,
        value => qr24
    );
    
    reg25: regTt port map(
        clk => clk,
        load => lr25,
        input => data,
        value => qr25
    );
    
    reg26: regTt port map(
        clk => clk,
        load => lr26,
        input => data,
        value => qr26
    );
    
    reg27: regTt port map(
        clk => clk,
        load => lr27,
        input => data,
        value => qr27
    );
    
    reg28: regTt port map(
        clk => clk,
        load => lr28,
        input => data,
        value => qr28
    );
    
    reg29: regTt port map(
        clk => clk,
        load => lr29,
        input => data,
        value => qr29
    );
    
    reg30: regTt port map(
        clk => clk,
        load => lr30,
        input => data,
        value => qr30
    );
    
    reg31: regTt port map(
        clk => clk,
        load => lr31,
        input => data,
        value => qr31
    );
    
    des_decoder_32: dec_Tt PORT MAP(
        sig => dest,
        
        a => ls0,
        b => ls1,
        c => ls2,
        d => ls3,
        e => ls4,
        f => ls5,
        g => ls6,
        h => ls7,
        i => ls8,
        j => ls9,
        k => ls10,
        l => ls11,
        m => ls12,
        n => ls13,
        o => ls14,
        p => ls15,
        q => ls16,
        r => ls17,
        s => ls18,
        t => ls19,
        u => ls20,
        v => ls21,
        w => ls22,
        x => ls23,
        y => ls24,
        z => ls25,
        aa => ls26,
        ab => ls27,
        ac => ls28,
        ad => ls29,
        ae => ls30,
        af => ls31
    );


    mux_a: mux_TTxTT PORT MAP(
        sig => src_a,
        a => qr0,
        b => qr1,
        c => qr2,
        d => qr3,
        e => qr4,
        f => qr5,
        g => qr6,
        h => qr7,
        i => qr8,
        j => qr9,
        k => qr10,
        l => qr11,
        m => qr12,
        n => qr13,
        o => qr14,
        p => qr15,
        q => qr16,
        r => qr17,
        s => qr18,
        t => qr19,
        u => qr20,
        v => qr21,
        w => qr22,
        x => qr23,
        y => qr24,
        z => qr25,
        aa => qr26,
        ab => qr27,
        ac => qr28,
        ad => qr29,
        ae => qr30,
        af => qr31, 
        ou => a
    );
    
    mux_b: mux_TTxTT PORT MAP(   
        sig => src_b,
        a => qr0,
        b => qr1,
        c => qr2,
        d => qr3,
        e => qr4,
        f => qr5,
        g => qr6,
        h => qr7,
        i => qr8,
        j => qr9,
        k => qr10,
        l => qr11,
        m => qr12,
        n => qr13,
        o => qr14,
        p => qr15,
        q => qr16,
        r => qr17,
        s => qr18,
        t => qr19,
        u => qr20,
        v => qr21,
        w => qr22,
        x => qr23,
        y => qr24,
        z => qr25,
        aa => qr26,
        ab => qr27,
        ac => qr28,
        ad => qr29,
        ae => qr30,
        af => qr31, 
        ou => b
    );
    
end Behavioral;
