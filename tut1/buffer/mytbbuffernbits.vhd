-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity mytbbuffernbits is
end mytbbuffernbits;
architecture mytbbuffernbits_Arch of mytbbuffernbits is
    component bufferNbits is
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
    end component;
    constant N : integer := 4;
    constant PERIOD : time := 50 us;
    signal e1_sim : std_logic_vector(N-1 downto 0) := (others => '0');
    signal s1_sim : std_logic_vector(N-1 downto 0) := (others => '0');
    signal reset_sim, preset_sim, clock_sim : std_logic := '0';
begin
    MyComponentbufferNbits01underTest : bufferNbits
    generic map (
        N => N
    )
    port map (
        e1 => e1_sim,
        reset => reset_sim,
        preset => preset_sim,
        clock => clock_sim,
        s1 => s1_sim
    );
    My_clock_Proc : process
    begin
        clock_sim <= '0';
        wait for 0.8*PERIOD/2;
        clock_sim <= '1';
        wait for 0.2*PERIOD/2;
        if now = (8*(2**N))*PERIOD then
            wait;
        end if;
    end process;
    MyStimulus_Proc2 : process
    begin
        for i in 0 to 1 loop
            for j in 0 to 1 loop
                for k in 0 to (2**N)-1 loop
                    e1_sim <= std_logic_vector(to_unsigned(k,N));
                    preset_sim <= to_unsigned(j,1)(0);
                    reset_sim <= to_unsigned(i,1)(0);
                    wait for 2*PERIOD;
                    report "reset = " & integer'image(i) & " | preset = " & integer'image(j) & " | e1 = " & integer'image(k) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
                end loop;
            end loop;
        end loop;
        report "Test done";
        wait;
    end process;
end mytbbuffernbits_Arch;
