library ieee;

use ieee.std_logic_1164.all;

entity fa_1b_tb is
end entity;

architecture Behavioural of fa_1b_tb is

    signal r_input_clk : STD_LOGIC := '0';

    signal r_input_a : STD_LOGIC := '0';
    signal r_input_b : STD_LOGIC := '0';
    signal r_input_c_in : STD_LOGIC := '0';
    signal r_output_sum : STD_LOGIC := '0';
    signal r_output_c_out : STD_LOGIC := '0';

    component fa_1b is
        port(
            a : in std_logic;
            b : in std_logic;
            c_in : in std_logic;
            sum : out std_logic;
            c_out : out std_logic
        );
    end component fa_1b;

    begin

        -- clock
        clock: process is
            begin
                wait for 100 ns;
                r_input_clk <= '1';
                wait for 100 ns;
                r_input_clk <= '0';
        end process;        

        stage_0 : fa_1b
        port map (
            a => r_input_a,
            b => r_input_b,
            c_in => r_input_c_in,
            sum => r_output_sum,
            c_out => r_output_c_out
        );

        r_input_a <= '0' after 100 ns, '1' after 200 ns, '1' after 300 ns, '1' after 400 ns;
        r_input_b <= '0' after 100 ns, '0' after 200 ns, '1' after 300 ns, '1' after 400 ns;
        r_input_c_in <= '0' after 100 ns, '0' after 200 ns, '0' after 300 ns, '1' after 400 ns;

end Behavioural;