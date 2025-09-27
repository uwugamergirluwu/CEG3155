library ieee;
use ieee.std_logic_1164.all;

entity SST is
    port (
        SST: out std_logic_vector(3 downto 0)
    );
end;

architecture Struct of SST is
begin
    SST <= "0011";
end;