----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2020 11:48:57 AM
-- Design Name: 
-- Module Name: voter - Behavioral
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

entity voter is
    Port ( A : in STD_LOGIC_VECTOR;
           B : in STD_LOGIC_VECTOR;
           C : in STD_LOGIC_VECTOR;
           D : out STD_LOGIC_VECTOR);
end voter;

architecture Behavioral of voter is

begin

process (A,B,C)
begin
    for I in A'low to A'high loop
        D(I) <= (A(I) and B(I)) or (A(I) and C(I)) or (C(I) and B(I));
    end loop;

end process;

end Behavioral;
