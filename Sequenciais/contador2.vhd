library ieee;
use ieee.std_logic_1164.all;

entity contador2 is
generic (N : integer := 3);
port(
		clk : in std_logic;
		Q   : out std_logic_vector(N downto 0));
end contador2;

architecture archContador2 of contador2 is

signal Qs : std_logic_vector(N downto 0);
signal sClear : std_logic;

component FlipFlopJK is
port(
		J, K: in std_logic;
		clear : in std_logic;
		preset : in std_logic;
		clk : in std_logic;
		Q, Qbar : out std_logic
	);
end component;

begin
	cont0: FlipFlopJK port map('0','0', '1', '1', clk, Qs(0));
	FOR01: for i in 0 to (N - 1) generate	
		cont1: FlipFlopJK port map('0','0', '1', '1', Qs(i), Qs(i+1));
	end generate;	
	Q <= Qs;

end archContador2;






