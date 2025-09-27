LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
	ENTITY enARdFF IS
		PORT(i_reset : in std_logic;
				i_d,i_enable,i_clock : in std_logic;
				o_q, o_qBar : OUT STD_LOGIC);
END enARdFF;
ARCHITECTURE rtl OF enARdFF IS
	SIGNAL int_q, int_qBar : STD_LOGIC;
	SIGNAL int_d, int_dBar : STD_LOGIC;
	SIGNAL int_notD, int_notClock : STD_LOGIC;
	COMPONENT enabledSRLatch
		PORT(
			i_set, i_reset : IN STD_LOGIC;
			i_enable : IN STD_LOGIC;
			o_q, o_qBar : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	-- Component Instantiation
	masterLatch: enabledSRLatch
	PORT MAP ( i_set => i_d,
				i_reset => i_reset,
				i_enable => i_enable,
				o_q => int_q,
				o_qBar => int_qBar);
	slaveLatch: enabledSRLatch
	PORT MAP ( i_set => int_q,
				i_reset => i_reset,
				i_enable => i_clock,
				o_q => o_q,
				o_qBar => o_qBar);

-- Concurrent Signal Assignment
	int_notD <= not(i_d);
	int_notClock <= not(i_clock);
END rtl;