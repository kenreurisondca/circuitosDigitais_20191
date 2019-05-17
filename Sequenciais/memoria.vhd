library ieee;
use ieee.std_logic_1164.all;

entity memoria is
port(
		I : in std_logic_vector(3 downto 0);
		clear : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end memoria;

architecture archMemoria of memoria is
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
	Q0 : FlipFlopJK port map(not(I(0)),I(0), clear, '1', clk, Q(0));
   Q1 : FlipFlopJK port map(not(I(1)),I(1), clear, '1', clk, Q(1));
	Q2 : FlipFlopJK port map(not(I(2)),I(2), clear, '1', clk, Q(2));
	Q3 : FlipFlopJK port map(not(I(3)),I(3), clear, '1', clk, Q(3));
end archMemoria;
