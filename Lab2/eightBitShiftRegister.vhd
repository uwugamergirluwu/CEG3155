LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY eightBitShiftRegister IS
			PORT(
				i_reset, i_load, i_shr, i_shl : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				i_Value : IN STD_LOGIC_VECTOR(7 downto 0);
				o_Value : OUT STD_LOGIC_VECTOR(7 downto 0)
			);
END eightBitShiftRegister;

ARCHITECTURE rtl OF eightBitShiftRegister IS
	SIGNAL int_Value, int_notValue : STD_LOGIC_VECTOR(7 downto 0);

		COMPONENT enARdFF_2
			PORT(
				i_reset : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				o_q, o_qBar : OUT STD_LOGIC);
		END COMPONENT;
BEGIN

msb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (i_Value(7) and i_load) or (i_Value(6) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(7),
				o_qBar => int_notValue(7));
		
sixthb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (i_Value(6) and i_load) or (i_Value(7) and i_shr) or (i_Value(5) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(6),
				o_qBar => int_notValue(6));
fifthb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (i_Value(5) and i_load) or (i_Value(6) and i_shr) or (i_Value(4) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(5),
				o_qBar => int_notValue(5));
fourthb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (int_Value(4) and i_load) or (i_Value(5) and i_shr) or (i_Value(3) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(4),
				o_qBar => int_notValue(4));	
thirdb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (int_Value(3) and i_load) or (i_Value(4) and i_shr) or (i_Value(2) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(3),
				o_qBar => int_notValue(3));
secondb: enARdFF_2
	PORT MAP (i_reset => i_reset,
				i_d => (int_Value(2) and i_load) or (i_Value(2) and i_shr) or (i_Value(1) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(2),
				o_qBar => int_notValue(2));			
firstb: enARdFF_2
		PORT MAP (i_reset => i_reset,
				i_d => (int_Value(1) and i_load) or (i_Value(1) and i_shr) or (i_Value(0) and i_shl),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(1),
				o_qBar => int_notValue(1));
lsb: enARdFF_2
		PORT MAP (i_reset => i_reset,
				i_d => (int_Value(0) and i_load) or (i_Value(71) and i_shr),
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value(0),
				o_qBar => int_notValue(0));

		-- Output Driver
		o_Value <= int_Value;
END rtl;