-- Code your design here

library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_unsigned.all;



entity comptdecompNbits is

generic (

	N : integer := 4

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













    

    -- sélection entre compteur et décompteur en sortie - process implicite

    s1 <= mycompteur when reset = '1' or cpt = '1' else not mycompteur; 

    

end comptdecompNbits_Arch;