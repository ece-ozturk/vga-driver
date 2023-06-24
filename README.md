## VGA driver
This is a VGA driver written in VHDL, for Bogazici University EE244 Digital Systems Design class.

This project is implemented on Xilinx Nexys3 and visualized on a CRT monitor, using VGA.


**The project consists of**
- *a frequency divider* (takes 100MHz board clock to generate 25 MHz clock signal)
- *a VGA synchronization module* (uses 25Mhz clock signal and returns timing synchronization signals)
- *a colour counter* (generates 8 RGB signals to represent 256 different colours next to each other in the displayable region)

For *640x480 VGA, 25Mhz pixel clock, 60Hz refresh rate*, following timing parameters are used:

<img width="600" alt="parameters" src="https://github.com/ece-ozturk/vga-driver/assets/127878597/0dfae9c0-c67d-40cd-ad55-935caf912537">
