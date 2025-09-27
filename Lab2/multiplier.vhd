LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity multiplier is
	port(
		M, Q : in std_logic_vector(3 downto 0);
		clock, reset, load : in std_logic;
		Out : out std_logic_vector(3 downto 0)
	);
end;

Architecture struct of multiplier is

SIGNAL A, M_out, Q_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL last : STD_LOGIC;


COMPONENT adderSubtractor
	port(in1, in2 : in std_logic_vector(3 downto 0);
	inCarry : in std_logic;
	outSum : out std_logic_vector(3 downto 0);
	outCarry : out std_logic
	);
	
Component fourBitArithShiftReg
	PORT(
		i_reset, i_load, i_shr, i_shl : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		i_Value : IN STD_LOGIC_VECTOR(3 downto 0);
		o_Value : OUT STD_LOGIC_VECTOR(3 downto 0)
	);

Component oneBitReg
	PORT(
		i_reset, i_load : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		i_Value : IN STD_LOGIC;
		o_Value : OUT STD_LOGIC
	);
Component eightBitShiftRegister
	PORT(
		i_reset, i_load, i_shr : IN STD_LOGIC;
		i_clock : IN STD_LOGIC;
		i_Value : IN STD_LOGIC_VECTOR(7 downto 0);
		o_Value : OUT STD_LOGIC_VECTOR(7 downto 0)
	);

End Component;

BEGIN

Count : eightBitShiftRegister
	PORT(
		i_reset => reset
		i_load => load
		i_shr => OPEN
		i_shl => OPEN
		i_clock => clock
		i_Value => M
		o_Value => M_out
	);

M : fourBitArithShiftReg
	PORT MAP(
		i_reset => reset
		i_load => load
		i_shr => OPEN
		i_shl => OPEN
		i_clock => clock
		i_Value => M
		o_Value => M_out
	);
	
Q : fourBitArithShiftReg
	PORT MAP(
		i_reset => reset
		i_load => load
		i_shr => (Q_out(0) and(last)) or (not(Q_out(0) and not(last))) 
		i_shl => OPEN
		i_clock => clock
		i_Value => Q
		o_Value => Q_out
	);
	
A : fourBitArithShiftReg
	PORT MAP{
		i_reset => reset
		i_load => load
		i_shr => 
		i_shl => OPEN
		i_clock => clock
		i_Value => "0000" 
		o_Value => A
	);
	
AddSub : adderSubtractor
	PORT MAP(
		in1 => A
		in2 => (M_out and (Q_out(0) and not(last))) or (not(M_out) + "0001")
		inCarry => OPEN
		outSum => OPEN
		outCarry => OPEN
	);

q0: 
	