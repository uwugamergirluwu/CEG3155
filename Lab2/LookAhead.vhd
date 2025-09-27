library ieee;
use ieee.std_logic_1164.all;

entity LookAhead is
    port (
        Prop_in, Gen_in: in std_logic_vector(3 downto 0);
        C_in: in std_logic;
        Prop_out, PG_out: out std_logic;
        C_out: out std_logic_vector(4 downto 0)
    );
end;

architecture rtl of LookAhead is
begin
    C_out(0) <= C_in;
    C_out(1) <= Gen_in(0) or (Prop_in(0) and i_Cin);
    C_out(2) <= Gen_in(1) or (Prop_in(1) and Gen_in(0)) or (Prop_in(1) and Prop_in(0) and C_in);
    C_out(3) <= Gen_in(2) or (Prop_in(2) and Gen_in(1)) or (Prop_in(2) and Prop_in(1) and Gen_in(0)) or (Prop_in(2) and Prop_in(1) and Prop_in(0) and C_in);
    C_out(4) <= Gen_in(3) or (Prop_in(3) and Gen_in(2)) or (Prop_in(3) and Prop_in(2) and Gen_in(1)) or (Prop_in(3) and Prop_in(2) and Prop_in(1) and Gen_in(0)) or (Prop_in(3) and Prop_in(2) and Prop_in(1) and Prop_in(0) and C_in);
    
    Prop_out <= Prop_in(3) and Prop_in(2) and Prop_in(1) and Prop_in(0);
    PG_out <= Gen_in(3) or (Prop_in(3) and Gen_in(2)) or (Prop_in(3) and Prop_in(2) and Gen_in(1)) or (Prop_in(3) and Prop_in(2) and Prop_in(1) and Gen_in(0));
end;