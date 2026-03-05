----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2026 20:11:19
-- Design Name: 
-- Module Name: tb_full_adder - tb_fa
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_full_adder is
end tb_full_adder;

architecture tb_fa of tb_full_adder is
    signal a, b, cin : std_logic := '0';
    signal sum, cout : std_logic;
begin

    uut : entity work.full_adder(rtl)
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum,
            cout => cout
        );
        
        
    process
        variable expected_sum : std_logic;
        variable expected_cout : std_logic;
        variable result : integer;
        variable result_lv : std_logic_vector(1 downto 0);
    begin
    
        for a_val in 0 to 1 loop
            for b_val in 0 to 1 loop
                for cin_val in 0 to 1 loop
                    if a_val = 1 then a <= '1'; else a <= '0'; end if;
                    if b_val = 1 then b <= '1'; else b <= '0'; end if;
                    if cin_val = 1 then cin <= '1'; else cin <= '0'; end if;
                    wait for 10 ns;
                    
                    result := a_val + b_val + cin_val;
                    result_lv := std_logic_vector(to_unsigned(result, 2));
                    expected_sum := result_lv(0);
                    expected_cout := result_lv(1);
                    
                    assert (expected_sum = sum and expected_cout = cout)
                        report "FAIL: a=" & integer'image(a_val) &
                               ", b=" & integer'image(b_val) &
                               ", cin=" & integer'image(cin_val) &
                               "# expected sum=" & std_logic'image(expected_sum) &
                               ", got sum=" & std_logic'image(sum) &
                               "# expected cout=" & std_logic'image(expected_cout) &
                               ", got cout=" & std_logic'image(cout)
                               severity error;
                end loop;
            end loop;
        end loop;
        report "*** all tests passed ***" severity note;
        wait;
    end process;
    
end tb_fa;
