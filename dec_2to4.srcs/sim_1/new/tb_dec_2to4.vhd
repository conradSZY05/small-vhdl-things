----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2026 20:32:20
-- Design Name: 
-- Module Name: tb_dec_2to4 - tb_dec
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

entity tb_dec_2to4 is
end tb_dec_2to4;

architecture tb_dec of tb_dec_2to4 is
    signal sel : std_logic_vector(1 downto 0);
    signal y : std_logic_vector(3 downto 0);
begin
    uut : entity work.dec_2to4(rtl)
        port map (
            sel => sel,
            y => y
        );
    
    process
        variable expected_y : std_logic_vector(3 downto 0) := (others => '0');
    begin
        
        for sel_val in 0 to 3 loop 
            sel <= std_logic_vector(to_unsigned(sel_val, 2));
        
            expected_y := std_logic_vector(to_unsigned(1, 4) sll sel_val);
            
            wait for 10 ns;
            
            assert expected_y = y
                report " FAIL -- sel : " & integer'image(sel_val) &
                       " expected : " & integer'image(to_integer(unsigned(expected_y))) &
                       " got : " & integer'image(to_integer(unsigned(y)))
                severity error;
        end loop;
        report "*** SUCCESS ***" severity note;
        wait;
    end process;

end tb_dec;
