-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity bufferNbits is
generic (
    N : integer := 4
);
port (
    e1 : in std_logic_vector (N-1 downto 0);
    reset : in std_logic;
    preset : in std_logic;
    clock : in std_logic;
    s1 : out std_logic_vector (N-1 downto 0)
);
end  bufferNbits;

architecture bufferNbits_Arch of bufferNbits is

begin
    MyBufferNbitsProc: process(clock, reset, preset) 
    begin
        if reset = '1' then
            s1 <= (others => '0');
        elsif rising_edge(clock) then
            if preset = '1' then
                    s1 <= (others => '1');
            else
                    s1 <= e1;
                end if;
        end if;
    end process MyBufferNbitsProc;

end bufferNbits_Arch;