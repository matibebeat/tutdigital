library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity multNbits is
    generic (
        N : integer := 4 -- Taille par défaut des entrées
    );
    port (
        e1 : in std_logic_vector(N-1 downto 0); -- Premier multiplicande
        e2 : in std_logic_vector(N-1 downto 0); -- Deuxième multiplicande
        s1 : out std_logic_vector(2*N - 1 downto 0) -- Produit des deux entrées
    );
end entity multNbits;

architecture multNbits_DataFlow of multNbits is
    signal my_e1 : std_logic_vector(N - 1 downto 0);
    signal my_e2 : std_logic_vector(N - 1 downto 0);
    signal my_s1 : std_logic_vector(2*N - 1 downto 0);
begin
    my_e1 <= e1;
    my_e2 <= e2;
    s1 <= my_s1(2*N-1 downto 0);

    my_s1 <= my_e1 * my_e2;

end architecture multNbits_DataFlow;