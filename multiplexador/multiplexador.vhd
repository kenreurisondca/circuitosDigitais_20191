library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
port
	(
		X3, X2, X1, X0 : in std_logic;
		S1, S0		   : in std_logic;
		L 					: in std_logic;
		Y					: out std_logic
	);
end multiplexador;

architecture archMultiplexador of multiplexador is
signal ylinha : std_logic;
begin
	ylinha <= (X0 and not(S1) and not(S0)) or
				 (X1 and (S1) and not(S0)) or
				 (X2 and not(S1) and (S0)) or
				 (X3 and (S1) and (S0));
	Y <= ylinha and L;
end archMultiplexador;