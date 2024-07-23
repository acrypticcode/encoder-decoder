----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2023 01:44:34 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           en1 : in STD_LOGIC;
           en2a_n : in STD_LOGIC;
           en2b_n : in STD_LOGIC;
           F : out STD_LOGIC;
           L : out STD_LOGIC_VECTOR(4 downto 0) );
end toplevel;

architecture Structural of toplevel is
--Component Declaration
component nand3_gate is
    Port ( W : in STD_LOGIC;
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Zout: out STD_LOGIC);
end component nand3_gate;

component decoder is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           g1 : in STD_LOGIC;
           g2a_n : in STD_LOGIC;
           g2b_n : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end component decoder;

--Signal Declaration
signal s: std_logic_vector (2 downto 0);

begin
--Component Instatiaton
mydecoder : decoder
    Port Map (
        g1 => en1,
        g2a_n => en2a_n,
        g2b_n => en2b_n,
        x(0) => A,
        x(1) => B,
        x(2) => C,
        y(0) => s(0),
        y(1) => s(1),
        y(7) => s(2),
        y(6 downto 2) => L(4 downto 0));
        --y(7) => L(4));
        
mynand : nand3_gate
    Port Map(
        W =>s(0),
        X => s(1),
        Y => s(2),
        Zout => F);

end Structural;
