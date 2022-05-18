
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


------------------------------------------------------------
entity UART_TX is

    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        data_i : in  std_logic_vector(6 downto 0);
        
          
        UART_o : out std_logic
  
    );
end entity UART_TX;


architecture Behavioral of UART_TX is

 
    -- parity bit
    signal parity_bit  : std_logic;
    --data
    signal  data : std_logic_vector(9 downto 0);
      
    signal s_cnt : std_logic_vector(3 downto 0);
    
    signal s_en  : std_logic;
    
begin
     clk_en : entity work.clock_enable
        generic map(
           
            g_MAX => 20833
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );
   
    parity_gen : entity work.parity_generator        
      
        port map(
            input_bits => data_i,
            parity   => parity_bit                   
        );  
         
   binary_counter: entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 4
        )
        port map(
            clk  => clk,
        reset    => reset,
        en_i     => s_en,
        cnt_up_i => '1',
        cnt_o    => s_cnt
        );
   
     p_assign : process(clk)
    begin
       
        if rising_edge(clk) then    

            if (reset = '1') then                 
                        
                 UART_o  <= '0'; 
                 data <= "0000000000";
         
         
           else  
                      
                 data(0)  <= '0';       -- start bit
                 data(1)  <= data_i(0); -- first bit of input data
                 data(2)  <= data_i(1);
                 data(3)  <= data_i(2);
                 data(4)  <= data_i(3);
                 data(5)  <= data_i(4); 
                 data(6)  <= data_i(5);
                 data(7)  <= data_i(6); -- last bit of input data 
                 data(8)  <= parity_bit;-- parity bit 
                 data(9)  <= '1';       -- stop bit
        case s_cnt is
            	when "0000" =>
                	UART_o <= data(0);
           		when "0001" =>
                	UART_o <= data(1);
                when "0010" =>
                	UART_o <= data(2);
                when "0011" =>
                	UART_o <= data(3);
                when "0100" =>
                	UART_o <= data(4);
                when "0101" =>
                	UART_o <= data(5);
                when "0110" =>
                	UART_o<= data(6);
                when "0111" =>
                	UART_o <= data(7);
                when "1000" =>
                	UART_o <= data(8);
                when "1001" =>
                	UART_o <= data(9);
                when others =>
                	UART_o <= data(9);
          
        	end case;
         
         
            end if;
        end if;
       
    end process p_assign;
    
   
end architecture Behavioral;
