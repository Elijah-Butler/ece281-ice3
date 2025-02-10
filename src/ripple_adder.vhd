----------------------------------------------------------------------------------
-- Implements a 4-bit Ripple-Carry adder from instantiated Full Adders
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port ( i_A : in STD_LOGIC_VECTOR (3 downto 0);
           i_B : in STD_LOGIC_VECTOR (3 downto 0);
           i_Cin : in STD_LOGIC;
           o_S : out STD_LOGIC_VECTOR (3 downto 0);
           o_Cout : out STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

    -- Declare components here
    component full_adder is
        port (
            i_A     : in std_logic;
            i_B     : in std_logic;
            i_Cin   : in std_logic;
            o_S     : out std_logic;
            o_Cout  : out std_logic
            );
        end component full_adder;
    -- Declare signals here
        signal w_carry  : STD_LOGIC_VECTOR(3 downto 0); -- for ripple between adders

begin

full_adder_0: full_adder
    port map(
        i_A     => i_A(0),
        i_B     => i_B(0),
        i_Cin   => i_Cin,   -- Directly to input here
        o_S     => o_S(0),
        o_Cout  => w_carry(0)
    );

    full_adder_1: full_adder
    port map(
        i_A     => i_A(1),
        i_B     => i_B(1),
        i_Cin   => w_carry(0),
        o_S     => o_S(1),
        o_Cout  => w_carry(1)
    );
    
    full_adder_2: full_adder
    port map(
        i_A     => i_A(2),
        i_B     => i_B(2),
        i_Cin   => w_carry(1),
        o_S     => o_S(2),
        o_Cout  => w_carry(2)
    );
    
    full_adder_3: full_adder
    port map(
        i_A     => i_A(3),
        i_B     => i_B(3),
        i_Cin   => w_carry(2),
        o_S     => o_S(3),
        o_Cout  => w_carry(3)
    );


end Behavioral;
