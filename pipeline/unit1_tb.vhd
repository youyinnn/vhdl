library ieee;

use ieee.std_logic_1164.all;

entity unit1_tb is
end entity;

architecture Behavioural of unit1_tb is

    signal r_input_clk  : STD_LOGIC := '0';
    signal r_input_load : std_logic := '0';
    signal r_input_clr  : std_logic := '0';

    signal r_input_a    : std_logic_vector(7 downto 0)  := (OTHERS => '0');
    signal r_input_b    : std_logic_vector(7 downto 0)  := (OTHERS => '0');
    signal r_output_z   : std_logic_vector(15 downto 0)  := (OTHERS => '0');

    component unit1 is
        port(
            clk  : in std_logic;
            load : in std_logic;
            clr  : in std_logic;
            a    : in std_logic_vector(7 downto 0);
            b    : in std_logic_vector(7 downto 0);
    
            z    : out std_logic_vector(15 downto 0)
        );
    end component unit1;

    begin

        -- sync clock
        -- clock: process is
        --     begin
        --         wait for 100 ns;
        --         r_input_clk <= '1';
        --         wait for 100 ns;
        --         r_input_clk <= '0';
        -- end process;     
        
        
        u1 : unit1
        port map (
            clk => r_input_clk,
            load => r_input_load,
            clr => r_input_clr,
            a => r_input_a,
            b => r_input_b,
            z => r_output_z
        );
        
        r_input_clk <= 
            -- clock 1 
            '1' after 300 ns, 
            '0' after 350 ns,
            -- clock 2
            '1' after 550 ns,
            '0' after 600 ns,
            '0' after 2000 ns
        ;
            
        r_input_a <= "00001000" after 50 ns, "00010010" after 400 ns;
        r_input_b <= "00001100" after 50 ns, "01010110" after 400 ns;

        r_input_load <= 
            '1' after 125 ns, 
            '0' after 175 ns,
            '1' after 425 ns, 
            '0' after 450 ns
        ;
        -- r_input_clr <= '1' after 550 ns, '0' after 575 ns; 

end Behavioural;