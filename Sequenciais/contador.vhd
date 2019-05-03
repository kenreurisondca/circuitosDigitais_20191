library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(
		clk : in std_logic;
		Q   : out std_logic_vector(3 downto 0));
end contador;

architecture archContador of contador is

signal Qs : std_logic_vector(3 downto 0) := "0000";
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

	cont0: FlipFlopJK port map('0','0', '1', sClear,   clk, Qs(0));
	cont1: FlipFlopJK port map('0','0', '1', sClear, Qs(0), Qs(1));
	cont2: FlipFlopJK port map('0','0', sClear, '1', Qs(1), Qs(2));
	cont3: FlipFlopJK port map('0','0', sClear, '1', Qs(2), Qs(3));
	
	Q <= Qs;
	sClear <= not(Qs(3) and Qs(2) and (not(Qs(1))) and Qs(0));
	

end archContador;






