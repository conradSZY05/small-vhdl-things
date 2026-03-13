----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2026 19:42:22
-- Design Name: 
-- Module Name: D_ff - rtl
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

entity D_ff is 
    port (
        clk, reset, en, set: in std_logic;
        d : in std_logic;
        q : out std_logic 
    );
end D_ff;

architecture D_ff of D_ff is
begin
    process (clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;
end D_ff;

architecture D_ff_async of D_ff is 
begin 
    
    process (clk, reset)
    begin
        if reset = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
    
end D_ff_async;

architecture D_ff_sync of D_ff is
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process;
    
end D_ff_sync;

architecture D_ff_en of D_ff is
begin

    process (clk, reset)
    begin
        if reset = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            if en = '1' then
                q <= d;
            end if;
        end if;
    end process;

end D_ff_en;

architecture T_ff of D_ff is
    signal q_o : std_logic := '0';
begin 

    process (clk)
    begin
        if rising_edge(clk) then
            if d = '1' then
                q_o <= not q_o;
            end if;
            
        end if;
    end process;
    
    q <= q_o;
end T_ff;

architecture SR_ff of D_ff is
begin
    --  set='0' and reset='0' hold, both '1' undefined
    process (clk)
    begin
        if rising_edge(clk) then
            if set = '1' and reset = '0' then
                q <= '1';
            elsif set = '0' and reset = '1' then
                q <= '0';
            end if;
        end if;
    end process;

end SR_ff;

architecture JK_ff of D_ff is
    signal q_o : std_logic;
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if set = '1' and reset = '1' then
                q_o <= not q_o;
            elsif set = '0' and reset = '1' then
                q_o <= '0';
            elsif set = '1' and reset = '0' then
                q_o <= '1';
            end if;
        end if;
    end process;
    q <= q_o;
    
end JK_ff;
