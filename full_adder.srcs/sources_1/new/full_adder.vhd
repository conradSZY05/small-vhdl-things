----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2026 19:51:14
-- Design Name: 
-- Module Name: full_adder - rtl
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

entity full_adder is
    port (
        a, b, cin : in std_logic;
        sum, cout : out std_logic
    );
end full_adder;

architecture rtl of full_adder is
    component half_adder
        port ( 
            a, b : in std_logic;
            sum, carry : out std_logic
        );
    end component;
    
    signal sum1, carry1, carry2 : std_logic;
begin

    ha1 : half_adder port map (a => a, b => b, sum => sum1, carry => carry1);
    ha2 : half_adder port map (a => sum1, b => cin, sum => sum, carry => carry2);
    cout <= carry1 or carry2;
    

end rtl;
