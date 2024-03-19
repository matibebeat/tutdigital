-- Code your design here

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comptdecompNbits is
generic (
    N : integer := 3
);
port (
    reset : in std_logic;
    cpt : in std_logic;
    clock : in std_logic;
    s1 : out std_logic_vector (N-1 downto 0)
);
end  comptdecompNbits;

architecture comptdecompNbits_Arch of comptdecompNbits is
    signal mycompteur : std_logic_vector (N-1 downto 0);
begin
    -- process explicite MyComptDecomptNBitsProc à créer par les étudiants 
    -- Reset asynchrone sur niveau haut
    -- Compteur / décompteur sur front montant de horloge 
    -- Cpt = 1 -> compteur et cpt = 0 -> décompteur

    -- Counter/Decounter process
    MyComptDecomptNBitsProc: process(clock)
    begin
        if reset = '1' then
            mycompteur <= (others => '0'); -- Reset the counter
        elsif rising_edge(clock) then
            if cpt = '1' then
                mycompteur <= mycompteur + 1; -- Increment the counter
            else
                mycompteur <= mycompteur - 1; -- Decrement the counter
            end if;
        end if;
    end process MyComptDecomptNBitsProc;

    -- sélection entre compteur et décompteur en sortie - process implicite
    s1 <= mycompteur;
end comptdecompNbits_Arch;