library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(
		clk : in std_logic;
		saida : out std_logic_vector(3 downto 0)
	  );
end contador;

architecture archContador of contador is
signal Q : std_logic_vector(3 downto 0);
signal J, K : std_logic_vector(3 downto 0);
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

	Q0 : FlipFlopJK port map(J(0), K(0), '1', '1', clk, Q(0));
	Q1 : FlipFlopJK port map(J(1), K(1), '1', '1', clk, Q(1));
	Q2 : FlipFlopJK port map(J(2), K(2), '1', '1', clk, Q(2));
	Q3 : FlipFlopJK port map(J(3), K(3), '1', '1', clk, Q(3));
	
	J(0) <= '0';
	K(0) <= Q(3) xor Q(1);
	J(1) <= (not(Q(3)) and Q(0)) or (Q(3) and Q(2)); 
	K(1) <= '0';
	J(2) <= (not(Q(3)) and not(Q(2))) and (Q(1) xnor Q(0));
	K(2) <= '0';
	J(3) <= not(Q(3) or Q(2));
	K(3) <= not(Q(3) and Q(2) and Q(1) and Q(0));
	
	saida <= Q;
end archContador;













