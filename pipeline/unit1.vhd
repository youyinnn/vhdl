library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unit1 is
    port(
        clk  : in std_logic;
        load : in std_logic;
        clr  : in std_logic;
        a    : in std_logic_vector(7 downto 0);
        b    : in std_logic_vector(7 downto 0);

        z    : out std_logic_vector(15 downto 0)
    );
end unit1;

architecture dataflow_arch of unit1 is

    signal s_a : std_logic_vector(7 downto 0);
    signal s_b : std_logic_vector(7 downto 0);
    signal s_before_add_reg : std_logic_vector(15 downto 0);
    signal s_after_add_reg : std_logic_vector(15 downto 0);
    signal s_before_output_reg : std_logic_vector(15 downto 0);

    signal add_c_out : std_logic;

    component fa_8b is
        port(
            c_in   : in  std_logic;
            a   : in  std_logic_vector(7 downto 0);
            b   : in  std_logic_vector(7 downto 0);
            sum : out std_logic_vector(15 downto 0);
            c_out   : out  std_logic
        );
    end component fa_8b;

    component sync_reg_16b is
        port(
            d : in STD_LOGIC_VECTOR(15 downto 0);
            clr : in std_logic;
            clk : in std_logic;
            q : out STD_LOGIC_VECTOR(15 downto 0)
        );

    end component sync_reg_16b;

    component async_reg_8b is
        port(
            d : in STD_LOGIC_VECTOR(7 downto 0);
            clr : in std_logic;
            load : in std_logic;
            q : out STD_LOGIC_VECTOR(7 downto 0)
        );

    end component async_reg_8b;

begin

    async_reg_a: async_reg_8b port
    map(
        d => a,
        clr => clr,
        load => load,
        q => s_a
    );

    async_reg_b: async_reg_8b port
    map(
        d => b,
        clr => clr,
        load => load,
        q => s_b
    );

    a_add_b: fa_8b port
    map(
        c_in => '0',
        a => s_a,
        b => s_b,
        sum => s_before_add_reg,
        c_out => add_c_out
    );

    sync_reg_stage_1: sync_reg_16b port
    map(
        d => s_before_add_reg,
        clr => clr,
        clk => clk,
        q => s_after_add_reg
    );

    shift: process(s_after_add_reg) is
        begin
            s_before_output_reg <= 
                std_logic_vector(shift_left(unsigned(s_after_add_reg), 1));
    end process;

    sync_reg_stage_2: sync_reg_16b port
    map(
        d => s_before_output_reg,
        clr => clr,
        clk => clk,
        q => z
    );


end dataflow_arch;