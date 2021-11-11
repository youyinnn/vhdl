library ieee;

use ieee.std_logic_1164.all;

entity reg_tb is
end entity;

architecture Behavioural of reg_tb is

    constant t_20_ns : time := 20 ns;
    constant t_40_ns : time := 40 ns;

    signal r_input_d : std_logic := '0';
    signal r_input_clr : std_logic := '0';
    signal r_input_load : std_logic := '0';

    signal r_output_q : std_logic := '0';

    component reginf is
        port(
        d : in std_logic;
        clr : in std_logic;
        load : in std_logic;
        q : out std_logic
        );

    end component reginf;

    begin
        UUT : reginf
        port map (
        d => r_input_d,
        clr => r_input_clr,
        load => r_input_load,
        q => r_output_q
        );

        p_comb : process is
            begin
                wait for t_20_ns;
                r_input_d <= '1';

                wait for t_20_ns;
                r_input_load <= '1';
                
                wait for t_20_ns;
                r_input_load <= '0';
                
                wait for t_40_ns;
                r_input_clr <= '1';
                
                wait for t_20_ns;
                r_input_clr <= '0';

            end process;

end Behavioural;