# UART vysílač

### Team members

* David Hromas

### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Project objectives

Cílem projektu je vytvoření vysílače, který odesílá data ve formátu 7O1 (7 datových bitů, lichá parita,1 stop bit (blok 8 bitů a stop bit)) s rychlostí 4800 Baud pomocí rozrhraní UART. Nastavení datového slova bude probíhat pomocí přepínačů. 

<a name="hardware"></a>

## Hardware description
![your figure](https://github.com/davidhro/DE1_projekt_2/blob/main/hardware/nexys-a7-callout.png)



Nastavení datového slova probíhá pomocí přepínačů (18). Výstup dat probíhá pomocí sdíleného UART/JTAG USB rozhraní (25). 



<a name="modules"></a>

## VHDL modules description and simulations

### parity_generator
Modul provádí operaci XOR se všemi vstupními bity, jeho výstupem je paritní bit. 

### UART_TX
Modul seřazuje bity (7 datových, jeden paritní a jeden stop bit) do zadaného formátu a odesílá je na výstup. Seřazení datových bitů probíhá LSB->MSB, po nich n8sleduj9 paritní bit a stop bit. Modul také zajišťuje požadovanou rychlost přenosu dat.



### Simulace modulů parity_generator a UART_TX
![your figure]()
<a name="top"></a>

## TOP module description and simulations

Write your text here.

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. https://github.com/tomas-fryza/digital-electronics-1
2. https://www.nandland.com/articles/what-is-a-uart-rs232-serial.html
3. https://forum.digikey.com/t/parity-generator-vhdl/12591

