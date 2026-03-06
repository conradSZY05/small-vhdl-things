----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 20:08:44
-- Design Name: 
-- Module Name: tb_ripple_adder - tb_ra
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ripple_adder is
end tb_ripple_adder;

architecture tb_ra of tb_ripple_adder is
    signal a, b : std_logic_vector(3 downto 0) := "0000";
    signal cin : std_logic := '0';
    signal sum : std_logic_vector(3 downto 0);
    signal cout : std_logic;
    
begin

    uut : entity work.ripple_adder(rtl)
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum,
            cout => cout
        );

    process
        variable expected_sum : std_logic_vector(3 downto 0);
        variable expected_cout : std_logic;
        variable result : integer;
        variable result_lv : std_logic_vector(4 downto 0);
    begin

        for a_val in 0 to 15 loop
            for b_val in 0 to 15 loop
                for cin_val in 0 to 1 loop
                
                    a <= std_logic_vector(to_unsigned(a_val, 4));
                    b <= std_logic_vector(to_unsigned(b_val, 4));
                    if(cin_val = 0) then cin <= '0'; else cin <= '1'; end if;
                    wait for 10 ns;
                    
                    result := a_val + b_val + cin_val;
                    result_lv := std_logic_vector(to_unsigned(result, 5));
                    
                    expected_sum := result_lv(3 downto 0);
                    expected_cout := result_lv(4);
                    
                    assert (expected_sum = sum and expected_cout = cout)
                        report "FAIL: a:" & integer'image(a_val) &
                               "b: " & integer'image(b_val) &
                               "cin: " & integer'image(cin_val) &
                               "# expected sum: " & integer'image(to_integer(unsigned(expected_sum))) &
                               "got sum: " & integer'image(to_integer(unsigned(sum))) &
                               "# expected cout: " & std_logic'image(expected_cout) &
                               "got cout: " & std_logic'image(cout) 
                               severity error;
                               
                    
                end loop;
            end loop;
        end loop;
        report "*** all tests passed ***" severity note;
        wait;
    end process;
end tb_ra;
