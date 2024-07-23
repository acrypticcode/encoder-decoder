----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2023 09:56:41 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    --note: all inputs and outputs are active low
    Port ( EI : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (7 downto 0);
           A : out STD_LOGIC_VECTOR (2 downto 0);
           GS : out STD_LOGIC;
           EO : out STD_LOGIC);
end encoder;

architecture Behavioral of encoder is
signal en : STD_LOGIC;
signal c : STD_LOGIC_VECTOR(9 downto 0);
signal y : STD_LOGIC_VECTOR(4 downto 0);

begin
c(0) <= EI;
c(1) <= EI nor I(7);
c(2) <= (EI nor I(6)) and I(7);
c(3) <= (EI nor I(5)) and I(6) and I(7);
c(4) <= (EI nor I(4)) and I(5) and I(6) and I(7);
c(5) <= (EI nor I(3)) and I(4) and I(5) and I(6) and I(7);
c(6) <= (EI nor I(2)) and I(3) and I(4) and I(5) and I(6) and I(7);
c(7) <= (EI nor I(1)) and I(2) and I(3) and I(4) and I(5) and I(6) and I(7);
c(8) <= (EI nor I(0)) and I(1) and I(2) and I(3) and I(4) and I(5) and I(6) and I(7);
c(9) <= not EI and I(0)and I(1) and I(2) and I(3) and I(4) and I(5) and I(6) and I(7);

with c select y <=
    "11111" when "0000000001",
    "00001" when "0000000010",
    "00101" when "0000000100",
    "01001" when "0000001000",
    "01101" when "0000010000",
    "10001" when "0000100000",
    "10101" when "0001000000",
    "11001" when "0010000000",
    "11101" when "0100000000",
    "11110" when "1000000000",
    "00000" when others;
    
A(2 downto 0) <= y(4 downto 2);
GS <= y(1);
EO <= y(0);
    
end Behavioral;
