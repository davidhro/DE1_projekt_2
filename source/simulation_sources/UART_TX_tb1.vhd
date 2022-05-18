library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity UART_TX_tb is
end;

architecture bench of UART_TX_tb is

  component UART_TX
      port(
          clk     : in  std_logic;
          reset   : in  std_logic;
          data_i : in  std_logic_vector(6 downto 0);
          UART_o : out std_logic
      );
  end component;

  signal s_clk: std_logic;
  signal s_reset: std_logic;
  signal s_data_i: std_logic_vector(6 downto 0);
  signal s_UART_o: std_logic ;

  constant clock_period: time := 10 ns;
 

begin

  uut: UART_TX port map ( clk    => s_clk,
                          reset  => s_reset,
                          data_i => s_data_i,
                          UART_o => s_UART_o );

  p_clk_gen : process
    begin
        while now < 10 ms loop 
            s_clk <= '0';
            wait for clock_period / 2;
            s_clk <= '1';
            wait for clock_period / 2;
        end loop;
        wait;
    end process p_clk_gen;
  
  
   p_reset_gen : process
    begin
            
        s_reset <= '1';
        wait for 1 ms;
        
        s_reset <= '0';
        wait;
         
    end process p_reset_gen;
    
  stimulus: process
  begin
  report "Stimulus process started" severity note;
        
        s_data_i <= "0001011";
        
        
        report "Stimulus process finished" severity note;
        wait;
   

   
    wait;
  end process;


end bench;
