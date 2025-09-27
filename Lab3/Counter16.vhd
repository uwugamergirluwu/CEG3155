library ieee;
library altera;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use altera.altera_primitives_components.all;

entity Counter16 is
    port (
        CLK, RESETN: in std_logic;
        EN, LOAD: in std_logic;
        INPUT: in std_logic_vector(3 downto 0);
        EXPIRE: out std_logic;
        VALUE: out std_logic_vector(3 downto 0)
    );
end;

architecture struct of Counter16 is
    component enARdFF_2 is
        port (
            i_resetBar: in std_logic;
            i_d: in std_logic;
            i_enable: in std_logic;
            i_clock: in std_logic;
            o_q, o_qBar: out std_logic
        );
    end component;
    
    signal Q_Next: std_logic_vector(3 downto 0);
    signal D, Q: std_logic_vector(3 downto 0);
begin
    Q_Next(3) <= Q(3) and (Q(2) or Q(1) or Q(0) or not EN);
    Q_Next(2) <= (Q(2) and (Q(1) or Q(0) or not EN))
                    or (Q(3) and not Q(2) and not Q(1) and not Q(0) and EN);
    Q_Next(1) <= (Q(1) and (Q(0) or not EN))
                    or (not Q(1) and not Q(0) and EN and (Q(3) or Q(2)));
    Q_Next(0) <= (Q(0) and not EN)
                    or (not Q(0) and EN and (Q(3) or Q(2) or Q(1)));
    
    D <=
        Q_Next when (LOAD = '0') else
        INPUT when (LOAD = '1');
                    
    generateDFF: for i in 3 downto 0 generate
        dffInst: enARdFF_2
            port map (
                i_resetBar => RESETN,
                i_d => D(i),
                i_enable => '1',
                i_clock => CLK,
                o_q => Q(i)
            );
    end generate;
    
    EXPIRE <= not or_reduce(Q);
    VALUE <= Q;
end;