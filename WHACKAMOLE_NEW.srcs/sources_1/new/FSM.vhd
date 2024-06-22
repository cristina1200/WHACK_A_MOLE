library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
Port 
(
    signal clk: in std_logic;
    signal rst: in std_logic;
    signal start: in std_logic;
    signal sw: in std_logic_vector(15 downto 0);
    signal led: out std_logic_vector(15 downto 0);
    signal punctaj: out std_logic_vector(7 downto 0)
);
end FSM;

architecture Behavioral of FSM is
    type stari is (idle, joc);

    signal stare_curenta: stari := idle;
    signal stare_urmatoare: stari := idle;

    type memorie is array (10 downto 0) of std_logic_vector(15 downto 0);
    signal celula_mem: memorie :=
    (
        0 => x"0001",-- 000000001
        1 => x"0002",-- 000000010
        2 => x"0004",-- 000000100
        3 => x"0008",--....
        4 => x"0010",
        5 => x"0020",
        6 => x"0040",
        7 => x"0080",
        8 => x"0100",
        9 => x"0200",
        10 => x"0400"
    );

    signal stocare_led: std_logic_vector(15 downto 0);
    signal counter_index_harciogi: std_logic_vector(3 downto 0) := "0000"; --
    
    signal puncte: std_logic_vector(7 downto 0) := x"00";
    
    --semnale pt intensitatea animatiei 
    signal delay_counter: integer := 0;
    signal timp_numarator: integer := 0;
    signal intensitate: std_logic_vector(2 downto 0) := "000";

begin
    punctaj <= puncte;


-- Determine animation speed
    timp_numarator <= 99999999 when intensitate = "000" else
                      74999999 when intensitate = "001" else
                      49999999 when intensitate = "010" else
                      24999999 when intensitate = "011" else
                       9999999 when intensitate = "100" else
                       7499999 when intensitate = "101" else
                       4999999 when intensitate = "110" else
                       2499999;

--determinarea starii curente 
    process(clk, rst)
    begin
        if rst = '1' then
            stare_curenta <= idle;
        elsif clk = '1' and clk'event then
            stare_curenta <= stare_urmatoare;
        end if;
    end process;
--determinarea starii urmatoare pe baza starii curente 
    process(stare_curenta, start)
    begin
        case stare_curenta is
            when idle =>
                if start = '1' then --daca s-a apasat butonul de start =>next
                    stare_urmatoare <= joc;
                else --daca nu mergem inapoi in starea initiala 
                    stare_urmatoare <= idle; 
                end if;
            when others =>
                stare_urmatoare <= joc;
        end case;
    end process;

-- incepe jocul si ledurile iau pe rand valorile din memorie 
    stocare_led <= celula_mem(conv_integer(counter_index_harciogi));

----selectia ledurilor 
    process(clk, rst)
    begin
        if rst = '1' then --initializam tot cu 0
            puncte <= (others => '0');
            counter_index_harciogi <= (others => '0');
            
            delay_counter <= 0;
            intensitate <= "000";  -- Reset intensitate
        
        elsif clk = '1' and clk'event then
            if stare_curenta = joc then
                if delay_counter < timp_numarator then
                    delay_counter <= delay_counter + 1;
                else
                    delay_counter <= 0;
                    if sw = stocare_led then
                        if counter_index_harciogi = "1010" then
                            counter_index_harciogi <= "0000";
                        else
                            counter_index_harciogi <= counter_index_harciogi + 1;
                        end if;
                        puncte <= puncte + 1;

                        -- creste intensitatea
                        if intensitate /= "111" then
                            intensitate <= intensitate + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    
    --implementare loica joc
    process(stare_curenta)
    begin
        case stare_curenta is
            when idle => led <= x"0000";
            when others => led <= stocare_led;
        end case;
    end process;

end Behavioral;
