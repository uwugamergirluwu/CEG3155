LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity adderSubtractor is
	port(in1, in2 : in std_logic_vector(3 downto 0);
	inCarry : in std_logic;
	outSum : out std_logic_vector(3 downto 0);
	outCarry : out std_logic
	);
end;

architecture Struct of adderSubtractor is

SIGNAL intC1, intC2, intC3, intC4 : std_logic;
SIGNAL int_out : std_logic_vector(3 downto 0);

COMPONENT FullAdder
	port(a, b, Cin : in std_logic;
	sum, Cout : out std_logic
	);
end component;

BEGIN

fullAdder1: FullAdder PORT MAP (a => in1(0),
	b => (in2(0) xor inCarry),
	Cin => inCarry,	
	sum => int_out(0),
	Cout => intC1
	);
fullAdder2: FullAdder PORT MAP (a => in1(1),
	b => (in2(1) xor inCarry),
	Cin => intC1,
	sum => int_out(1),
	Cout => intC2
	);
fullAdder3: FullAdder PORT MAP (a => in1(2),
	b => (in2(2) xor inCarry),
	Cin => intC2,	
	sum => int_out(2),
	Cout => intC3
	);
fullAdder4: FullAdder PORT MAP (a => in1(3),
	b => (in2(3) xor inCarry),
	Cin => intC3,
	sum => int_out(3),
	Cout => intC4
	);
	
	outSum <= int_out;
	outCarry <= intC4;
end;
