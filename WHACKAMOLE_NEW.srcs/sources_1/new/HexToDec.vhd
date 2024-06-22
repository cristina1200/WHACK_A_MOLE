----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2024 06:28:02 PM
-- Design Name: 
-- Module Name: conv_min_sec - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HexToDec is
Port 
( 
signal intrare:in std_logic_vector(5 downto 0);
signal iesire1:out std_logic_vector(3 downto 0);
signal iesire2:out std_logic_vector(3 downto 0)
);
end HexToDec;

architecture Behavioral of HexToDec is

begin

convertor_zecimal:process(intrare)
begin
case intrare is
when "000000" =>iesire2<="0000";iesire1<="0000"; --0
when "000001" =>iesire2<="0000";iesire1<="0001"; --1
when "000010" =>iesire2<="0000";iesire1<="0010"; --2
when "000011" =>iesire2<="0000";iesire1<="0011"; --3
when "000100" =>iesire2<="0000";iesire1<="0100"; --4
when "000101" =>iesire2<="0000";iesire1<="0101"; --5
when "000110" =>iesire2<="0000";iesire1<="0110"; --6
when "000111" =>iesire2<="0000";iesire1<="0111"; --7
when "001000" =>iesire2<="0000";iesire1<="1000"; --8
when "001001" =>iesire2<="0000";iesire1<="1001"; --9
when "001010" =>iesire2<="0001";iesire1<="0000"; --10
when "001011" =>iesire2<="0001";iesire1<="0001"; --11
when "001100" =>iesire2<="0001";iesire1<="0010"; --12
when "001101" =>iesire2<="0001";iesire1<="0011"; --13
when "001110" =>iesire2<="0001";iesire1<="0100"; --14
when "001111" =>iesire2<="0001";iesire1<="0101"; --15
when "010000" =>iesire2<="0001";iesire1<="0110"; --16
when "010001" =>iesire2<="0001";iesire1<="0111"; --17
when "010010" =>iesire2<="0001";iesire1<="1000"; --18
when "010011" =>iesire2<="0001";iesire1<="1001"; --19
when "010100" =>iesire2<="0010";iesire1<="0000"; --20
when "010101" =>iesire2<="0010";iesire1<="0001"; --21
when "010110" =>iesire2<="0010";iesire1<="0010"; --22
when "010111" =>iesire2<="0010";iesire1<="0011"; --23
when "011000" =>iesire2<="0010";iesire1<="0100"; --24
when "011001" =>iesire2<="0010";iesire1<="0101"; --25
when "011010" =>iesire2<="0010";iesire1<="0110"; --26
when "011011" =>iesire2<="0010";iesire1<="0111"; --27
when "011100" =>iesire2<="0010";iesire1<="1000"; --28
when "011101" =>iesire2<="0010";iesire1<="1001"; --29
when "011110" =>iesire2<="0011";iesire1<="0000"; --30
when "011111" =>iesire2<="0011";iesire1<="0001"; --31
when "100000" =>iesire2<="0011";iesire1<="0010"; --32
when "100001" =>iesire2<="0011";iesire1<="0011"; --33
when "100010" =>iesire2<="0011";iesire1<="0100"; --34
when "100011" =>iesire2<="0011";iesire1<="0101"; --35
when "100100" =>iesire2<="0011";iesire1<="0110"; --36
when "100101" =>iesire2<="0011";iesire1<="0111"; --37
when "100110" =>iesire2<="0011";iesire1<="1000"; --38
when "100111" =>iesire2<="0011";iesire1<="1001"; --39
when "101000" =>iesire2<="0100";iesire1<="0000"; --40
when "101001" =>iesire2<="0100";iesire1<="0001"; --41
when "101010" =>iesire2<="0100";iesire1<="0010"; --42
when "101011" =>iesire2<="0100";iesire1<="0011"; --43
when "101100" =>iesire2<="0100";iesire1<="0100"; --44
when "101101" =>iesire2<="0100";iesire1<="0101"; --45
when "101110" =>iesire2<="0100";iesire1<="0110"; --46
when "101111" =>iesire2<="0100";iesire1<="0111"; --47
when "110000" =>iesire2<="0100";iesire1<="1000"; --48
when "110001" =>iesire2<="0100";iesire1<="1001"; --49
when "110010" =>iesire2<="0101";iesire1<="0000"; --50
when "110011" =>iesire2<="0101";iesire1<="0001"; --51
when "110100" =>iesire2<="0101";iesire1<="0010"; --52
when "110101" =>iesire2<="0101";iesire1<="0011"; --53
when "110110" =>iesire2<="0101";iesire1<="0100"; --54
when "110111" =>iesire2<="0101";iesire1<="0101"; --55
when "111000" =>iesire2<="0101";iesire1<="0110"; --56
when "111001" =>iesire2<="0101";iesire1<="0111"; --57
when "111010" =>iesire2<="0101";iesire1<="1000"; --58
when "111011" =>iesire2<="0101";iesire1<="1001"; --59
when others=>   iesire2<="0110";iesire1<="0000"; --60
end case;
end process;
end Behavioral;
