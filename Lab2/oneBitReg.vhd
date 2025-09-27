LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY oneBitReg IS
			PORT(
				i_reset, i_load : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				i_Value : IN STD_LOGIC;
				o_Value : OUT STD_LOGIC
			);
END oneBitReg;

ARCHITECTURE rtl OF oneBitReg IS
	SIGNAL int_Value, int_notValue : STD_LOGIC;

		COMPONENT enARdFF_2
			PORT(
				i_reset : IN STD_LOGIC;
				i_d : IN STD_LOGIC;
				i_enable : IN STD_LOGIC;
				i_clock : IN STD_LOGIC;
				o_q, o_qBar : OUT STD_LOGIC);
		END COMPONENT;
BEGIN

dFF: enARdFF_2
		PORT MAP (i_reset => i_reset,
				i_d => i_Value
				i_enable => i_load,
				i_clock => i_clock,
				o_q => int_Value,
				o_qBar => int_notValue);

		-- Output Driver
		o_Value <= int_Value;
END rtl;