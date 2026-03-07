----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2026 15:56:29
-- Design Name: 
-- Module Name: mux_8to1 - rtl
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
use IEEE.NUMERIC_STD.ALL;



library work;
use work.my_types.all;

entity mux_8to1 is
    port (
        din : in integer_array(7 downto 0);
        sel : in std_logic_vector(2 downto 0);
        y : out integer
    );
end mux_8to1;


architecture rtl of mux_8to1 is
begin

    y <= din(to_integer(unsigned(sel))); 
        
end rtl;
