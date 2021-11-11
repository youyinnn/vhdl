library ieee;

use ieee.std_logic_1164.all;

entity fa_8b_tb is
end entity;

architecture Behavioural of fa_8b_tb is

    signal r_input_clk : STD_LOGIC := '0';

    signal r_input_c_in    : std_logic := '0';
    signal r_input_a    : std_logic_vector(7 downto 0)  := (OTHERS => '0');
    signal r_input_b    : std_logic_vector(7 downto 0)  := (OTHERS => '0');
    signal r_output_sum : std_logic_vector(15 downto 0) := (OTHERS => '0');
    signal r_output_c_out : std_logic  :=  '0';


    component fa_8b is
        port(
            c_in   : in  std_logic;
            a   : in  std_logic_vector(7 downto 0);
            b   : in  std_logic_vector(7 downto 0);
            sum : out std_logic_vector(15 downto 0);
            c_out   : out  std_logic
        );
    end component fa_8b;

    begin

        -- clock
        clock: process is
            begin
                wait for 100 ns;
                r_input_clk <= '1';
                wait for 100 ns;
                r_input_clk <= '0';
        end process;        

        s_0 : fa_8b
        port map (
            a => r_input_a,
            b => r_input_b,
            c_in => r_input_c_in,
            sum => r_output_sum,
            c_out => r_output_c_out
        );

        r_input_c_in <= 
        '0' after 100 ns, 
        '1' after 200 ns,
        '0' after 300 ns, 
        '1' after 400 ns, 
        '1' after 500 ns, 
        '1' after 600 ns, 
        '0' after 1000 ns;

        r_input_a <= 
            "00000000" after 100 ns, 
            "00001110" after 200 ns,
            "11111111" after 300 ns, 
            "01001010" after 400 ns, 
            "11101011" after 500 ns, 
            "01101001" after 600 ns, 
            "11111111" after 1000 ns;

        r_input_b <= 
            "00000000" after 100 ns, 
            "00110101" after 200 ns, 
            "00000001" after 300 ns, 
            "10101001" after 400 ns, 
            "11001100" after 500 ns, 
            "00110011" after 600 ns, 
            "11111111" after 1000 ns;

end Behavioural;