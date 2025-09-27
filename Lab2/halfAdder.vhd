LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity halfAdder is
	port(x, y : IN STD_LOGIC;
		s_o : out STD_LOGIC;
		c_o : out STD_LOGIC
	);
end halfAdder;

Architecture Structural of halfAdder is
begin
		s_o <= x xor y;
		c_o <= x and y;
end; 
