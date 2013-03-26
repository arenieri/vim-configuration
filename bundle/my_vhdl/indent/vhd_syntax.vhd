-- comment
-- comment

library LIB1;
use LIB1.pack.all;

library LIB2;
use LIB2.pack.all;

entity ent is
    generic (
        gen1 : std_logic := '0';
        gen2 : integer : 1 
    );
    port (
        port1 : in std_logic;
        port2 : in std_logic_vector(2 downto 0);
        port3 : out std_logic;
        port4 : inout std_logic 
    );
end ent;

architecture arc of ent is

    type RegName is (AX, BX, CX, DX);

    type Operation is record
        Mnemonic : String (1 to 10);
        OpCode : Bit_Vector(3 downto 0);
        Op1, Op2, Res : RegName;
    end record;

    component comp is
        generic (
            gen1 : integer := 0;
            gen2 : integer := 1
        );
        port (
            portA : in std_logic;
            portB : in std_logic;
            portC : out std_logic;
        );
    end component;

    signal sig1 : std_logic;
    signal sig2 : std_logic;

begin

    comp_inst : comp
    generic map (
        gen1 => g1,
        gen2 => g2
        )
    port map (
        port1 => p1,
        port2 => p2
    );

    comp_inst2 : entity comp_lib.comp(beh)
    generic map (
        gen1 => g1,
        gen2 => g2
        )
    port map (
        port1 => p1,
        port2 => p2
    );

    label1 : process(port1, port2)
    begin
        -- comment
        if port1='1' then
            sig1 <= '1';
        elsif port2="11" then
            if sig1 = '1' then
                sig1 <= '0'; -- end - verificare se end in un commento non viene riconosciuto
            end if;
        else
            port3 <= '1';
        end if;

        case port2 is
            when "00" =>
                sig1 <= '1';
            when "11" =>
                sig2 <= '1';
            when others =>
                sig1 <= '0';
        end case;

        assert sig2='1'
            report "End Report"  -- questa linea verifica che end nel testo non venga riconosciuto
            severity NOTE;

    end process;

    g1 : for i in 0 to 3 generate
        comp_inst : comp
        port map(
            A => A(i),
            B => B(i)
        );

        BufOut <= BufIn when Enable = '1' else 'Z';
    end generate;

    with Command select
    DataOut <= InA and InB when "000",
               InA xnor InB when "101",
               'Z' when others;

    with Command select DataOut <= InA and InB when "000",
                                   InA xnor InB when "101",
                                   'Z' when others;

    g1 : for i in 0 to 3 generate
        comp_inst : comp
        port map(
            A => A(i),
            B => B(i)
        );
        BufOut <= BufIn when Enable = '1' else 'Z';
    end generate;

    BufOut <= BufIn when Enable = '1' else 'Z';
    BufOut <= BufIn when Enable = '1' 
              else 'Z';

    g1 : for i in 0 to 3 generate
        comp_inst : comp
        port map(
            A => A(i),
            B => B(i)
        );
        BufOut <= BufIn when Enable = '1' else 'Z';
    end generate;

end arc;



package lfsr_pkg is

    type Operation is record
        Mnemonic : String (1 to 10);
        OpCode : Bit_Vector(3 downto 0);
        Op1, Op2, Res : RegName;
    end record;

    -- comment
    function many_to_one_fb (DATA: std_logic, 
        TAPS :std_logic_vector) 
        return std_logic_vector;

    constant ca : integer := 1;

    function one_to_many_fb (DATA, TAPS :std_logic_vector) return std_logic_vector;

    constant cb : integer := 2;

end package;

package body lfsr_pkg is

    function many_to_one_fb (DATA, TAPS :std_logic_vector) return std_logic_vector is
        variable xor_taps :std_logic;
        variable all_0s   :std_logic;
        variable feedback :std_logic;
    begin

    -- Validate if lfsr = to zero (Prohibit Value)
        if (DATA(DATA'length-2 downto 0) = 0) then
        -- comment
            all_0s := '1';
        else
            all_0s := '0'; --end
        end if;

        xor_taps := '0';
        for idx in 0 to (TAPS'length-1) loop
            if (TAPS(idx) = '1') then
                xor_taps := xor_taps xor DATA(idx);
            end if;
        end loop;

        feedback := xor_taps xor all_0s;

        return DATA((DATA'length-2) downto 0) & feedback;

    end function;



end package;




