library ieee;
use ieee.std_logic_1164.all;

entity divisorFrequencia is
port(
		clk_in :  in std_logic;
		clk_out: out std_logic
	);
end divisorFrequencia;

architecture archDivisorFrequencia of divisorFrequencia is
	signal Qs : std_logic_vector(25 downto 0);
	signal Q50M : std_logic_vector(25 downto 0) := "10111110101111000010000000";
	signal C : std_logic_vector(25 downto 0)    := "00000000000000000000000001";
	signal sClear : std_logic_vector(25 downto 0);
	signal zerar : std_logic;
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
	FF0 : flipFlopJK port map('0', '0', zerar, '1', clk_in, Qs(0));
	RFOR: for I in 1 to 25 generate
		FFN : flipFlopJK port map('0', '0', zerar, '1', Qs(I-1), Qs(I));
	end generate RFOR;
	
	CFOR : for I in 1 to 25 generate
		sClear(I) <= sClear(I-1) and C(I);
	end generate CFOR;
	
	sClear(0) <= C(0);
	clk_out <= Qs(25);
	C <= Qs xnor Q50M;
	zerar <= sClear(25);
	
end archDivisorFrequencia;















