library ieee;

use ieee.std_logic_1164.all;

entity fa_1b is
    port(
        a_1b, b_1b, c_in : in  std_logic;
        sum_1b, c_out : out std_logic
    );
end fa_1b;

architecture dataflow_arch of fa_1b is
begin
    sum_1b <= a_1b xor b_1b xor c_in;
	c_out <= (a_1b and b_1b) or (c_in and a_1b) or (c_in and b_1b);
end dataflow_arch;