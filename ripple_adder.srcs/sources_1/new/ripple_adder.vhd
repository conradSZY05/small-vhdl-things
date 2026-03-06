----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2026 19:54:20
-- Design Name: 
-- Module Name: ripple_adder - rtl
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

entity ripple_adder is
    port (
        a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end ripple_adder;

architecture rtl of ripple_adder is
    component full_adder
        port (
            a, b, cin : in std_logic;
            sum, cout: out std_logic            
        );
    end component;
       
    signal c1, c2, c3, c4: std_logic;
begin

    fa1 : full_adder port map (a => a(0), b => b(0), cin => cin, sum => sum(0), cout => c1);
    fa2 : full_adder port map (a => a(1), b => b(1), cin => c1, sum => sum(1), cout => c2);
    fa3 : full_adder port map (a => a(2), b => b(2), cin => c2, sum => sum(2), cout => c3);
    fa4 : full_adder port map (a => a(3), b => b(3), cin => c3, sum => sum(3), cout => cout);

end rtl;
