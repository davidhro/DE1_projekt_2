--------------------------------------------------------------------------------
--
--   FileName:         parity_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus Prime Version 17.0.0 Build 595 SJ Lite Edition
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 4/25/2018 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity parity_generator IS
  generic(
    inputs    : integer  := 7;    
    parity_eo : std_logic := '1'); --'0' for even, '1' for odd parity
  port(
    input_bits : in  std_logic_vector(inputs-1 downto 0); --input data
    parity     : out std_logic);                          --result
end parity_generator;

architecture logic of parity_generator is
  signal  parity_calc : std_logic_vector(inputs downto 0); --intermediate results
begin

  --parity calculation logic
  parity_calc(0) <= parity_eo;                             --set first result to even or odd
  parity_logic: for i in 0 to inputs-1 generate
    parity_calc(i+1) <= parity_calc(i) xor input_bits(i);  --XOR each result with the next input bit
  end generate;
  parity <= parity_calc(inputs);                           --output the final result
  
end logic;
