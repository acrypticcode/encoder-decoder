----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2023 12:27:33 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           g1 : in STD_LOGIC;
           g2a_n : in STD_LOGIC;
           g2b_n : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
y(0)<= not g1 or g2a_n or g2b_n or x(0) or x(1) or x(2);
y(1)<= not g1 or g2a_n or g2b_n or x(0) or x(1) or not x(2);
y(2)<= not g1 or g2a_n or g2b_n or x(0) or not x(1) or x(2);
y(3)<= not g1 or g2a_n or g2b_n or x(0) or not x(1) or not x(2);
y(4)<= not g1 or g2a_n or g2b_n or not x(0) or x(1) or x(2);
y(5)<= not g1 or g2a_n or g2b_n or not x(0) or x(1) or not x(2);
y(6)<= not g1 or g2a_n or g2b_n or not x(0) or not x(1) or x(2);
y(7)<= not g1 or g2a_n or g2b_n or not x(0) or not x(1) or not x(2);



end Behavioral;
