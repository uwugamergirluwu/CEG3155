library ieee;
library altera;
use ieee.std_logic_1164.all;
use altera.altera_primitives_components.all;

entity Controller is
    port (
        clk, reset: in std_logic;
        SSCS: in std_logic;
        countEnd: in std_logic;
		  
		  load, enable : out std_logic;
        counterSel: out std_logic_vector(1 downto 0);
        MSTL: out std_logic_vector(2 downto 0);
        SSTL: out std_logic_vector(2 downto 0)
		  
    );
end;

architecture Struct of Controller is
    component enARdFF_2 is
        port (
            i_resetBar: in std_logic;
            i_d: in std_logic;
            i_enable: in std_logic;
            i_clock: in std_logic;
            o_q, o_qBar: out std_logic
        );
    end component;

    signal Q: std_logic_vector(1 downto 0);
begin
    generateDFF: for i in 1 downto 0 generate
        dffInst: enARdFF_2
            port map (
                i_resetBar => reset,
                i_d => Q(i),
                i_enable => '1',
                i_clock => clk,
                o_q => Q(i)
            );
    end generate;
    
    -- States
    Q(1) <= (Q(1) and not Q(0)) or (Q(1) and Q(0) and not countEnd) or (not Q(1) and Q(0) and count);
    Q(0) <= (Q(0) and not SSCS and not countEnd) or (Q(1) and not Q(0) and countEnd) or (Q(0)) and SSCS and not countEnd) or (not Q(1) and not Q(0) and SSCS and countEnd);
    
    -- Output
    MSTL(2) <= (not Q(1) and not Q(0));
    MSTL(1) <= (not Q(1) and Q(0));
    MSTL(0) <= Q(1);
    
    SSTL(2) <= (Q(1) and not Q(2));
    SSTL(1) <= Q(1) and Q(0);
    SSTL(0) <= not Q(1);
	 
	 counterSel(1) <= Q(1);
	 counterSel(0) <= Q(0);
	 load <= countEnd;
	 enable <=  not countEnd;
end;