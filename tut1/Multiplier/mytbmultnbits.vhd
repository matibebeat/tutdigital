library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity myMultNbitstestbench is
end myMultNbitstestbench;

architecture myMultNbitstestbench_Arch of myMultNbitstestbench is
    component multNbits is
        generic (
            N : integer
        );
        port (
            e1 : in std_logic_vector(N-1 downto 0);
            e2 : in std_logic_vector(N-1 downto 0);
            s1 : out std_logic_vector(2*N - 1 downto 0)
        );
    end component;

    constant N : integer := 3;
 
    signal e1_sim, e2_sim  : std_logic_vector(N-1 downto 0) := (others => '0');
    signal s1_sim : std_logic_vector(2*N-1 downto 0) := (others => '0');

begin
    
    MyComponentMultNbitsUnderTest : multNbits
    generic map(
        N => N
    )
    port map(
        e1 => e1_sim,
        e2 => e2_sim,
        s1 => s1_sim
    );

    Stimulus_Process : process
    begin
        for i in 0 to (2**N)-1 loop
            for j in 0 to (2**N)-1 loop
                e1_sim <= std_logic_vector(to_unsigned(i, N));
                e2_sim <= std_logic_vector(to_unsigned(j, N));
                wait for 100 ns; 
                report " | e1 = " & integer'image(i) & " | e2 = " & integer'image(j) & " || s1 = " & integer'image(to_integer(unsigned(s1_sim)));
                assert s1_sim = std_logic_vector(unsigned(e1_sim) * unsigned(e2_sim)) report "Failure" severity failure;
            end loop;
        end loop;
        report "Test ok (no assert...)";
        wait;
    end process Stimulus_Process;

end myMultNbitstestbench_Arch;