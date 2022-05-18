library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (6 downto 0);                 
           BTNC : in STD_LOGIC;
           
           UART_RXD_OUT : out STD_LOGIC
           
           );
           
          
end top;

architecture Behavioral of top is

begin

  --------------------------------------------------------
  
  uart_transmitter : entity work.UART_TX
   
      port map(
          clk       => CLK100MHZ,
          reset     => BTNC,
          data_i(0) => SW(0),
          data_i(1) => SW(1),
          data_i(2) => SW(2),
          data_i(3) => SW(3),
          data_i(4) => SW(4),
          data_i(5) => SW(5),
          data_i(6) => SW(6),
          

          UART_o => UART_RXD_OUT
      );


end architecture Behavioral;
