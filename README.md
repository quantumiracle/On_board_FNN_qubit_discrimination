# FPGA+ARM on board implemented FNN (fully-connected neural network) for single qubit discrimination in ion trap
[paper: _Fast and High-Fidelity Readout of Single Trapped-Ion Qubit via Machine Learning Methods_
Zi-Han Ding, Jin-Ming Cui, Yun-Feng Huang, Chuan-Feng Li, Tao Tu, Guang-Can Guo](https://arxiv.org/abs/1810.07997v1)
currently under submission at Physics Review Applied.
## Abstract
We introduce machine learning(ML) methods to implement readout of single qubit on ![equ.1](https://latex.codecogs.com/gif.latex?^{171}Yb^+) trapped-ion system. We compare different ML methods including convolutional neural networks(CNN) and full-connected neural networks with traditional methods in test. A fast single qubit readout embedded system on Zynq-7000 Soc development board with ARM and FPGA is also proposed in our work. ML methods like CNN shows higher-fidelity, robuster readout results in a shorter time. Fully-connected neural network for single qubit readout can reach 99.5\% accuracy within 171 us on our embedded hardware system, while traditional maximum likelihood method and threshold method needs almost one time longer. Moreover, ML method is robuster with lower error variance. 

## General structure
<img src="https://github.com/quantumiracle/On_board_FNN_qubit_discrimination/blob/master/fig_77.png" width="80%">

## Program

### Program structure 
<img src="https://github.com/quantumiracle/On_board_FNN_qubit_discrimination/blob/master/structure.png" width="100%">

Above program is in ```/zynq/ps_pl/document/```.

### Vivado diagram

<img src="https://github.com/quantumiracle/On_board_FNN_qubit_discrimination/blob/master/scheme.jpg" width="100%">

All codes are in ```zynq/pspl/document```, including software codes (C based, or C++ based, depending on whether it's a naked machine or one with a Linux system; if you choose a standalone application in SDx, you could only use C based codes with libraries provided by the software; if it's a Linux platform application, you could use the C++ based codes, but make sure you have a boot image of Linux system which contains C++ supporting libraries) in ```soft_code``` and hardware codes (verilog codes) in ```rtl```. 

The implemention project of hardware codes is in ```zynq/pspl/hw_proj```, including ```project.xpr```(open it in Vivado). 

Totally three versions of programs are uploaded here in ```zynq``` file, ```ps_pl``` is a tesing version uploaded originally, ```ps_pl5_online.zip``` and ```ps_pl7sdcard.zip``` are practical. 

Workable overall programs:```ps_pl5_online.zip``` is for online debugging (with wired connection to program the device); ```ps_pl7sdcard.zip``` is for SD_card image booting (create the .bin boot image and put it in SD card) with extra ```fsbl.elf```.

### Basic usage
[Usage Document](https://github.com/quantumiracle/On_board_FNN_qubit_discrimination/blob/master/zynq_use.doc)

