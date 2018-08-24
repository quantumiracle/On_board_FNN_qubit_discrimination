# On board (FPGA+ARM) FNN(fully-connected neural network) implemention of qubit_discrimination
## Abstract
We introduce machine learning(ML) methods to implement readout of single qubit on $^{171}Yb^+$ trapped-ion system. We compare different ML methods including convolutional neural networks(CNN) and full-connected neural networks with traditional methods in test. A fast single qubit readout embedded system on Zynq-7000 Soc development board with ARM and FPGA is also proposed in our work. ML methods like CNN shows higher-fidelity, robuster readout results in a shorter time. Fully-connected neural network for single qubit readout can reach 99.5\% accuracy within 171$\mu s$ on our embedded hardware system, while traditional maximum likelihood method and threshold method needs almost one time longer. Moreover, ML method is robuster with lower error variance. 

## Program
All codes are in ```zynq/pspl/document```, including software codes (C based, or C++ based, depending on whether it's a naked machine or one with a Linux system
; if you choose a standalone application in sDx, you could only use C based codes with libraries provided by the software; if it's a 
Linux platform application, you could use the C++ based codes, but make sure you have a boot image of Linux system which contains 
C++ supporting libraries) in ```soft_code``` and hardware codes (verilog codes) in ```rtl```. The implemention project of hardware codes is in ```zynq/pspl/hw_proj```
, including ```project.xpr```(open it in Vivado).
