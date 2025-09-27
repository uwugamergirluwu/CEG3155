library ieee;
use ieee.std_logic_1164.all;

entity fourBitComplimenter is
    port (
        INPUT: in std_logic_vector(3 downto 0);
        OUTPUT: out std_logic_vector(3 downto 0)
    );
end;

architecture Struct of fourBitComplimenter is
BEGIN
    OUTPUT(0) <= INPUT(0);
	 OUTPUT(1) <= INPUT(1) xor INPUT(0);
    OUTPUT(2) <= INPUT(2) xor (INPUT(1) or INPUT(0));
	 OUTPUT(3) <= INPUT(3) xor (INPUT(2) or INPUT(1) or INPUT(0));
END;