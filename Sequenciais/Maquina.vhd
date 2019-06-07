library ieee;
use ieee.std_logic_1164.all;

entity Maquina is
port(
		w   : in std_logic;
		clk : in std_logic;
		Q   : out std_logic_vector(1 downto 0);
		z   : out std_logic
	);
end Maquina;

architecture archMaquina of Maquina is
component FlipFlopJK is
port(
		J, K: in std_logic;
		clear : in std_logic;
		preset : in std_logic;
		clk : in std_logic;
		Q, Qbar : out std_logic
	);
end component;
signal Qf : std_logic_vector(1 downto 0);
signal Qa : std_logic_vector(1 downto 0);
begin
	Q1 : flipFlopJK port map(not Qf(1), Qf(1), '1', '1', clk, Qa(1));
	Q0 : flipFlopJK port map(not Qf(0), Qf(0), '1', '1', clk, Qa(0));
	Qf(1) <= (w and (Qa(1) xor Qa(0))) or
				((not w) and (Qa(1) xnor Qa(0)));
	Qf(0) <= not(Qa(0));
	z <= Qa(0);
	Q <= Qa;
end archMaquina;



















