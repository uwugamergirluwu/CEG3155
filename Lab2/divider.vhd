LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity divider is
	port (dividend, divisor : in STD_logic_vector(3 downto 0);
	quotient, remainder : out STD_logic_vector(7 downto 0)
	);
end;

architecture structural of divider is

SIGNAL R, Q, M : std_logic_vector(7 downto 0); 

Component FullAdder
	port(a, b Cin : in STD_logic;
	sum, Cout : out std_logic
	);
	
Component eightBitShiftRegister
	port(i_reset, i_load, i_shr, i_shl, i_clock, i_Value : in std_logic;
	o_Value : out std_logic
	);

End Component;

BEGIN
	