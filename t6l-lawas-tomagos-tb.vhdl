library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_boggis_bunce_bean_buzzer is	
	constant DELAY: time := 10 ns;	
end entity;

architecture tb of tb_boggis_bunce_bean_buzzer is

	signal Y: std_logic;
	signal A,B,C,D,E,F: std_logic;

	component boggis_bunce_bean_buzzer is
			port(Y:out std_logic; A,B,C,D,E,F:in std_logic);
	end component;
begin

	uut: component boggis_bunce_bean_buzzer port map(Y,A,B,C,D,E,F);
	main: process is
	
			variable temp: unsigned(5 downto 0);
			variable expected_y: std_logic;
			variable actual_y: std_logic;
			variable error_count: integer := 0;
			
	begin --process
	
		report "start simulation";
		
		for i in 0 to 63 loop --for(i=0; i<=63; i++)
		
			temp := TO_UNSIGNED(i, 6);
			A <= temp(5);
			B <= temp(4);
			C <= temp(3);
			D <= temp(2);
			E <= temp(1);
			F <= temp(0);

			-- compute actual_y
			actual_y := (temp(5) or temp(3) or temp(1)) and (temp(4) or temp(2) or temp(0));
			
			if (actual_y = '1') then 
				expected_y := '1';
			else expected_y := '0';
			end if;
			wait for DELAY;
			
			assert(expected_y = actual_y)
				report "ERROR: Expected output y (" &
					std_logic'image(expected_y) & ") /= actual (" &
					std_logic'image(actual_y) &
					") at time " & time'image(now);

			if (expected_y /= actual_y)
				then error_count := error_count + 1;
			end if;
		end loop;
		
		wait for DELAY;
		assert (error_count = 0)
			report "ERROR: There were " &
				integer'image(error_count) & " errors!";
			if(error_count = 0)
				then report "Simulation completed with NO errors.";
			end if;
		wait;
	end process;
end architecture tb;
