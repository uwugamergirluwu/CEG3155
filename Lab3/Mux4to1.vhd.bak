LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_2to1 is
	port(
		i0, i1, i2, i3 : in STD_LOGIC_VECTOR(7 downto 0);
		s0, s1 : in STD_LOGIC;
		o : out STD_LOGIC_VECTOR(7 downto 0)
	);
end mux_2to1;

architecture structural of mux_2to1 IS
SIGNAL m, n, l, p : STD_LOGIC_VECTOR(7 downto 0);
begin
	m(7) <= i0(7) and not s1 and not s2;
	m(6) <= i0(6) and not s1 and not s2;
	m(5) <= i0(5) and not s1 and not s2;
	m(4) <= i0(4) and not s1 and not s2;
	m(3) <= i0(3) and not s1 and not s2;
	m(2) <= i0(2) and not s1 and not s2;
	m(1) <= i0(1) and not s1 and not s2;
	m(0) <= i0(0) and not s1 and not s2;
	n(7) <= i1(7) and not s2 and s1;
	n(6) <= i1(6) and not s2 and s1;
	n(5) <= i1(5) and not s2 and s1;
	n(4) <= i1(4) and not s2 and s1;
	n(3) <= i1(3) and not s2 and s1;
	n(2) <= i1(2) and not s2 and s1;
	n(1) <= i1(1) and not s2 and s1;
	n(0) <= i1(0) and not s2 and s1;
	l(7) <= i2(7) and s2 and not s1;
	l(6) <= i2(6) and s2 and not s1;
	l(5) <= i2(5) and s2 and not s1;
	l(4) <= i2(4) and s2 and not s1;
	l(3) <= i2(3) and s2 and not s1;
	l(2) <= i2(2) and s2 and not s1;
	l(1) <= i2(1) and s2 and not s1;
	l(0) <= i2(0) and s2 and not s1;
	p(7) <= i3(7) and s2 and s1;
	p(6) <= i3(6) and s2 and s1;
	p(5) <= i3(5) and s2 and s1;
	p(4) <= i3(4) and s2 and s1;
	p(3) <= i3(3) and s2 and s1;
	p(2) <= i3(2) and s2 and s1;
	p(1) <= i3(1) and s2 and s1;
	p(0) <= i3(0) and s2 and s1;
	o <= m or n or l or p;
end;
