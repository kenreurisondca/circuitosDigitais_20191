library ieee;
use ieee.std_logic_1164.all;

entity conversor is
port(
  I      : in std_logic_vector(3 downto 0);
  Y		: out std_logic_vector(6 downto 0));
end conversor;
 
architecture archConversor of conversor is
begin
  WITH I SELECT
    Y <= not("1111110") WHEN "0000",
                 not("0110000") WHEN "0001",
                 not("1101101") WHEN "0010",
                 not("1111001") WHEN "0011",
                 not("0110011") WHEN "0100",
                 not("1011011") WHEN "0101",
                 not("1011111") WHEN "0110",
                 not("1110000") WHEN "0111",
                 not("1111111") WHEN "1000",
                 not("1111011") WHEN "1001",
					  not("1110111") WHEN "1010",
					  not("0011111") WHEN "1011",
					  not("1001110") WHEN "1100",
					  not("0111101") WHEN "1101",
					  not("1001111") WHEN "1110",
					  not("1000111") WHEN "1111",
					  not("0000000") WHEN OTHERS;
end archConversor;
	