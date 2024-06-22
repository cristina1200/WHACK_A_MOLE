----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2024 12:30:23 PM
-- Design Name: 
-- Module Name: test_env - Behavioral
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

entity Nexys4 is
port ( signal clk:in std_logic;
signal btn:in std_logic_vector(4 downto 0);
signal sw:in std_logic_vector(15 downto 0);
signal led:out std_logic_vector(15 downto 0);
signal cat:out std_logic_vector(7 downto 0);
signal an:out std_logic_vector(7 downto 0));
end Nexys4;

architecture Behavioral of Nexys4 is

--COMPONENTS--

component MPG is
 Port ( signal btn:in std_logic;
        signal clk:in std_logic;
        signal en:out std_logic
 );
 end component;
 
component SSD is
    Port ( Clk  : in  STD_LOGIC;
           Rst  : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);   -- datele pentru 8 cifre (cifra 1 din stanga: biti 31..28)
           An   : out STD_LOGIC_VECTOR (7 downto 0);    -- selectia anodului activ
           Seg  : out STD_LOGIC_VECTOR (7 downto 0));   -- selectia catozilor (segmentelor) cifrei active
end component;


component FSM is
Port 
(
signal clk:in std_logic;
signal rst:in std_logic;
signal start:in std_logic;
signal sw:in std_logic_vector(15 downto 0);
signal led:out std_logic_vector(15 downto 0);
signal punctaj:out std_logic_vector(7 downto 0)
 );
end component;

--SIGNALS--

signal rst:std_logic;
signal start:std_logic;
signal puncte:std_logic_vector(7 downto 0);
signal date:std_logic_vector(31 downto 0);
signal iesire1:std_logic_vector(3 downto 0);
signal iesire2:std_logic_vector(3 downto 0);
signal intrare:std_logic_vector(5 downto 0);
begin

btn_reset:MPG port map(clk=>clk,btn=>btn(0),en=>rst);
btn_start:MPG port map(clk=>clk,btn=>btn(1),en=>start);
UCC:FSM port map(clk=>clk,rst=>rst,start=>start,sw=>sw,led=>led,punctaj=>puncte);
intrare<=puncte(5 downto 0);
Hex:entity work.HexToDec 
Port map
(  intrare=>intrare,
 iesire1=>iesire1,
 iesire2=>iesire2);

date<=iesire2 & iesire1 & x"000000" ;

afisor:SSD port map ( Clk=>clk,Rst =>rst,Data=>date,An =>an,Seg =>cat);
end Behavioral;
