library ieee;
use ieee.std_logic_1164.all;

entity memoriacompleta is
port(
		Ip  : in std_logic_vector(3 downto 0);
		E   : in std_logic_vector(1 downto 0);
		C   : in std_logic ;
		F   : in std_logic;
		Ii  : in std_logic;
		clk : in std_logic;
		Qs	 : out std_logic_vector(3 downto 0)
	);
end memoriacompleta;

architecture archMemoriacompleta of memoriacompleta is

component memoria is
port(
		I   : in std_logic_vector(3 downto 0);
		clear : in std_logic;
		clk : in std_logic;
		Q   : out std_logic_vector(3 downto 0)
	);
end component;
	
	signal Ie : std_logic_vector(3 downto 0);
	signal Q : std_logic_vector(3 downto 0) := "0000";
begin
	Ie(0) <= (C and Ip(0)) or (not(C) and not (E(1)) and not (E(0)) and Ii) or (not(C) and Q(0) and not(not (E(1)) and not (E(0))));
	Ie(1) <= (C and Ip(1)) or (not(C) and not (E(1)) and E(0) and Ii) or (not(C) and Q(1) and not(not (E(1)) and E(0)));
	Ie(2) <= (C and Ip(2)) or (not(C) and E(1) and not (E(0)) and Ii) or (not(C) and Q(2) and not(E(1) and not (E(0))));
	Ie(3) <= (C and Ip(3)) or (not(C) and E(1) and E(0) and Ii) or (not(C) and Q(3) and not(E(1) and E(0)));
	
	Q0 : memoria port map(Ie,F,clk, Q);
	Qs <= Q;

end archMemoriacompleta;
	