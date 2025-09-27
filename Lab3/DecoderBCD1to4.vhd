library ieee;
use ieee.std_logic_1164.all;

entity DecoderBCD1to4 is
    port (
        inp: in std_logic_vector(3 downto 0);
        out1, out0: out std_logic_vector(3 downto 0)
    );
end entity;

architecture Structural of inpary2BCDDecoder4 is
begin
    out1(3 downto 1) <= "000";
    out1(0) <= (inp(3) and inp(1)) or (inp(3) and inp(2));
    
    out0(3) <= inp(3) and not inp(2) and not inp(1);
    out0(2) <= inp(2) and (not inp(3) or inp(1));
    out0(1) <= (not inp(3) and inp(1)) or (inp(3) and inp(2) and not inp(1));
    out0(0) <= inp(0);
end;