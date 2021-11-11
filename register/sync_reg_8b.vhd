library IEEE;
use IEEE.std_logic_1164.all;

ENTITY sync_reg_8b IS
   PORT
   (
      clr, clk : IN STD_LOGIC;
      d         : IN STD_LOGIC_VECTOR(7 downto 0);
      q         : OUT STD_LOGIC_VECTOR(7 downto 0)
   );
END sync_reg_8b;

ARCHITECTURE arch OF sync_reg_8b IS
BEGIN
   
   -- postive edge reg 
   PROCESS (clk, clr)                      
   BEGIN
      IF clr = '1' THEN            
         q <= (OTHERS => '0');
      ELSIF clk'EVENT AND clk = '1' THEN
         q <= d;
      END IF;
   END PROCESS;
   
END arch;