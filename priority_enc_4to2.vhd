----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2026 19:59:08
-- Design Name: 
-- Module Name: priority_enc_4to2 - rtl
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

entity priority_enc_4to2 is
    port (
        d : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(1 downto 0)
    );
end priority_enc_4to2;

architecture rtl of priority_enc_4to2 is
begin
    
    process (d)
    begin
        case? d is
            when "0001" => y <= "00";
            when "001-" => y <= "01";
            when "01--" => y <= "10";
            when "1---" => y <= "11";
            when others => y <= "XX";
        end case?;
    end process;
    

end rtl;
