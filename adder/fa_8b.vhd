library ieee;

use ieee.std_logic_1164.all;

entity fa_8b is
    port(
        c_in : in std_logic;
        a, b : in  std_logic_vector(7 downto 0);
        sum  : out std_logic_vector(15 downto 0);
        c_out: out std_logic
    );
end fa_8b;

architecture structure_arch of fa_8b is

    signal c1, c2, c3, c4   :	std_logic;
	signal c5, c6, c7	    :	std_logic;
    signal c8, c9, c10, c11 :	std_logic;
	signal c12, c13, c14	:	std_logic;
	signal c15	            :	std_logic;

    component fa_1b is
        port(
            a_1b      : in std_logic;
            b_1b      : in std_logic;
            c_in      : in std_logic;
            sum_1b  : out std_logic;
            c_out   : out std_logic
        );
    end component fa_1b;

begin

    stage_0: fa_1b port map(a(0), b(0), c_in, sum(0), c1);
    stage_1: fa_1b port map(a(1), b(1), c1, sum(1), c2);
    stage_2: fa_1b port map(a(2), b(2), c2, sum(2), c3);
    stage_3: fa_1b port map(a(3), b(3), c3, sum(3), c4);
    stage_4: fa_1b port map(a(4), b(4), c4, sum(4), c5);
    stage_5: fa_1b port map(a(5), b(5), c5, sum(5), c6);
    stage_6: fa_1b port map(a(6), b(6), c6, sum(6), c7);
    stage_7: fa_1b port map(a(7), b(7), c7, sum(7), c8);

    stage_8: fa_1b port map('0', '0', c8, sum(8), c9);
    stage_9: fa_1b port map('0', '0', c9, sum(9), c10);
    stage_10: fa_1b port map('0', '0', c10, sum(10), c11);
    stage_11: fa_1b port map('0', '0', c11, sum(11), c12);
    stage_12: fa_1b port map('0', '0', c12, sum(12), c13);
    stage_13: fa_1b port map('0', '0', c13, sum(13), c14);
    stage_14: fa_1b port map('0', '0', c14, sum(14), c15);
    stage_15: fa_1b port map('0', '0', c15, sum(15), c_out);

end structure_arch;