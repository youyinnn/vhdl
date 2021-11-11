library IEEE;
use IEEE.std_logic_1164.all;

ENTITY async_reg_8b IS
   PORT
   (
      clr, load : IN STD_LOGIC;
      d         : IN STD_LOGIC_VECTOR(7 downto 0);
      q         : OUT STD_LOGIC_VECTOR(7 downto 0)
   );
END async_reg_8b;

ARCHITECTURE arch OF async_reg_8b IS
BEGIN
   
   PROCESS (load, clr)                      
   BEGIN
      IF clr = '1' THEN            
         q <= (OTHERS => '0');
      ELSIF load'EVENT AND load = '0' THEN
         q <= d;
      END IF;
   END PROCESS;
   
END arch;