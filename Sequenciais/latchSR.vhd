library ieee;
use ieee.std_logic_1164.all;

entity latchSR is
port(
		R  : in std_logic;
		S  : in std_logic;
		--Clk: in std_logic;
		Qa : out std_logic;
		Qb : out std_logic);
end latchSR;

architecture archLatchSR of latchSR is
	--signal RSignal : std_logic;
	--signal SSignal : std_logic;
	signal QaSignal: std_logic;
	signal QbSignal: std_logic;
begin
	
	--RSignal <= R and Clk;
	--SSignal <= S and Clk;
	--QaSignal <= R nor QbSignal;
	--QbSignal <= S nor QaSignal;
	QaSignal <= not (R or QbSignal);
	QbSignal <= not (S or QaSignal);
	
	Qa <= QaSignal;
	Qb <= QbSignal;
end archLatchSR;
