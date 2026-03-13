----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2026 20:16:45
-- Design Name: 
-- Module Name: bcd_disp - rtl
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

entity bcd_disp is
    port (
        clk_i : in std_logic;
        bcd0_i : in std_logic_vector(3 downto 0);
        bcd1_i : in std_logic_vector(3 downto 0);
        bcd2_i : in std_logic_vector(3 downto 0);
        bcd3_i : in std_logic_vector(3 downto 0);
        dis_o : out std_logic_vector(6 downto 0);
        an_o : out std_logic_vector(3 downto 0)
    );
end bcd_disp;

architecture rtl of bcd_disp is
    constant CLK_DIVIDER : integer := 399999; -- basys 3 on chip clock is 100 MHz, 100MHz / 400000 = 4 ms clock
    signal clk_enable : std_logic;
    signal clk_count : integer := 0;
    
    signal digit_sel : unsigned(1 downto 0);
    signal active_bcd : std_logic_vector(3 downto 0);
    signal dis : std_logic_vector(6 downto 0);
begin

    
    process (clk_i)
    begin
        if rising_edge(clk_i) then
            clk_enable <= '0';
            if clk_count = CLK_DIVIDER then
                clk_count <= 0;
                clk_enable <= '1';
            else 
                clk_count <= clk_count + 1;
            end if;
            
            if clk_enable = '1' then
                digit_sel <= digit_sel + 1; -- 0 to 3 then wraps round to 0
            end if;
        end if;
    end process;
    
    with digit_sel select
        an_o <= "1110" when "00",
                "1101" when "01",
                "1011" when "10",
                "0111" when others;

    with digit_sel select
        active_bcd <= bcd0_i when "00",
                      bcd1_i when "01",
                      bcd2_i when "10",
                      bcd3_i when others;

    -- dis = "ABCDEFG"
    with active_bcd select
        dis <= "1000000" when "0000",
               "1111001" when "0001",
               "0100100" when "0010",
               "0110000" when "0011",
               "0011001" when "0100",
               "0010010" when "0101",
               "0000010" when "0110",
               "1111000" when "0111",
               "0000000" when "1000",
               "0010000" when "1001",
               "1111111" when others;
               
    dis_o <= dis;

end rtl;
