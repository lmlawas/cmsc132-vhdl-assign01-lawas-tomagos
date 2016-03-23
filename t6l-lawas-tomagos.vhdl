library IEEE; use IEEE.std_logic_1164.all;

entity boggis_bunce_bean_buzzer is
	port(Y:out std_logic; A,B,C,D,E,F:in std_logic);	
end entity;

architecture buzzer_behavior of boggis_bunce_bean_buzzer is
begin
	Y <= (E and F) or (D and E) or (C and F) or (C and D) or (B and E) or (B and C) or (A and F) or (A and D) or (A and B);
end architecture;