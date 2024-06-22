----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2024 02:06:56 PM
-- Design Name: 
-- Module Name: DCD_Hexa - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dcd is
Port (
hexa: in std_logic_vector (3 downto 0);
abcdefg: out std_logic_vector (6 downto 0)
   );
end dcd;

architecture Behavioral of dcd is

begin
abcdefg <=   "0000001" when hexa = x"0" else
			 "1001111" when hexa = x"1" else
			 "0010010" when hexa = x"2" else
			 "0000110" when hexa = x"3" else
			 "1001100" when hexa = x"4" else
			 "0100100" when hexa = x"5" else
			 "0100000" when hexa = x"6" else
			 "0001111" when hexa = x"7" else
			 "0000000" when hexa = x"8" else
			 "0001100" when hexa = x"9" else
   			 "1111111";

end Behavioral;