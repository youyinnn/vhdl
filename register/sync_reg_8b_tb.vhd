library ieee;

use ieee.std_logic_1164.all;

entity sync_reg_8b_tb is
end entity;

architecture Behavioural of sync_reg_8b_tb is

    signal r_input_d : STD_LOGIC_VECTOR(7 downto 0) := (OTHERS => '0');
    signal r_input_clr : STD_LOGIC := '0';
    signal r_input_clk : STD_LOGIC := '0';
    signal r_output_q : STD_LOGIC_VECTOR(7 downto 0) := (OTHERS => '0');

    component sync_reg_8b is
        port(
            d : in STD_LOGIC_VECTOR(7 downto 0);
            clr : in std_logic;
            clk : in std_logic;
            q : out STD_LOGIC_VECTOR(7 downto 0)
        );

    end component sync_reg_8b;

    begin
        UUT : sync_reg_8b
        port map (
            d => r_input_d,
            clr => r_input_clr,
            clk => r_input_clk,
            q => r_output_q
        );

        -- clock
        clock: process is
            begin
                wait for 100 ns;
                r_input_clk <= '1';
                wait for 100 ns;
                r_input_clk <= '0';
        end process;

        r_input_clr <= '1' after 300 ns, '0' after 350 ns;
        r_input_d <= "00000111" after 100 ns, "00010010" after 500 ns;

end Behavioural;