library IEEE;
use ieee.std_logic_1164.all;



entity sumador is
	port( A,B: in std_logic_vector(3 downto 0);
			Uni : out std_logic_vector(6 downto 0);
			Dec : out std_logic_vector(6 downto 0) );
end sumador;


architecture arqSUM of sumador is


------------------------------------------------
	component fullAdd4bits is
	port (A , B : in std_logic_vector(3 downto 0);
			result: out std_logic_vector(3 downto 0);
			cout : out std_logic );
	end component;

------------------------------------------------
	component bcd7seg is
	port(IA	: in  std_logic_vector(3 downto 0);
		  A	: out std_logic_vector(6 downto 0) );
	end component;
------------------------------------------------
	component incognita is
	port( sum : in std_logic_vector(4 downto 0);
			D : out std_logic_vector(3 downto 0);
			U : out std_logic_vector(3 downto 0) );
	end component;
------------------------------------------------


	signal sum_result : std_logic_vector(3 downto 0);
	signal cout_concatenar : std_logic;
	signal INinc : std_logic_vector(4 downto 0);
	
	signal unidades : std_logic_vector(3 downto 0);
	signal dececnas : std_logic_vector(3 downto 0);
	
	

begin
	
	
	
	K1 : fullAdd4bits port map( A , B , sum_result , cout_concatenar );
	
	   INinc <= cout_concatenar & sum_result;
		  
	K2 : incognita port map( INinc, dececnas, unidades);
			
	K3 : bcd7seg port map( unidades , Uni );
			
	K4 : bcd7seg port map( dececnas, Dec );
	
	
end arqSUM;