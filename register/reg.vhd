library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reginf IS
   PORT
   (
      d, clr, load  : IN STD_LOGIC;
      q       : OUT STD_LOGIC
   );
END reginf;
ARCHITECTURE maxpld OF reginf IS
BEGIN
  
   
   -- Register with active-high clock & asynchronous clear
   PROCESS (load, clr)                      
   BEGIN
       IF clr = '1' THEN            
          q <= '0';
       ELSIF load'EVENT AND load = '0' THEN
          q <= d;
       END IF;
   END PROCESS;

   
END maxpld;