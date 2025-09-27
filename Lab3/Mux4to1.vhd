LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Mux4to1 is
	port(
		i0, i1, i2, i3 : in STD_LOGIC_VECTOR(3 downto 0);
		s0, s1 : in STD_LOGIC;
		o : out STD_LOGIC_VECTOR(3 downto 0)
	);
end mux_2to1;

architecture structural of Mux4to1 IS
SIGNAL m, n, l, p : STD_LOGIC_VECTOR(3 downto 0);
begin
	m(3) <= i0(3) and not s1 and not s2;
	m(2) <= i0(2) and not s1 and not s2;
	m(1) <= i0(1) and not s1 and not s2;
	m(0) <= i0(0) and not s1 and not s2;
	
	n(3) <= i1(3) and not s2 and s1;
	n(2) <= i1(2) and not s2 and s1;
	n(1) <= i1(1) and not s2 and s1;
	n(0) <= i1(0) and not s2 and s1;
	
	l(3) <= i2(3) and s2 and not s1;
	l(2) <= i2(2) and s2 and not s1;
	l(1) <= i2(1) and s2 and not s1;
	l(0) <= i2(0) and s2 and not s1;
	
	p(3) <= i3(3) and s2 and s1;
	p(2) <= i3(2) and s2 and s1;
	p(1) <= i3(1) and s2 and s1;
	p(0) <= i3(0) and s2 and s1;
	o <= m or n or l or p;
end;
