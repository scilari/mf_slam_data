Magnetic field data for SLAM
============================
This repository contains magnetic field (MF) data collected in 2010-2011 with iRobot Create and MicroMag 3-axis magnetometer to perform MF-based SLAM. The data is used in experiments in my PhD research and the related MF SLAM papers 
(e.g. [here](http://ieeexplore.ieee.org/abstract/document/6088632/)
and [here](http://ieeexplore.ieee.org/abstract/document/6766512/)), and published for reproducibility.

## Contents
* Raw mapping data (used to produce SLAM data by downsampling and filtering)
* Validation data (used to evaluate localization performance afterwards)
* Calibration data (used to find out the magnetometer bias)
* Matlab script to visualize the raw data and produce SLAM data
* Downsampled 2Hz data for selected data sets (contains produced robot control and MF readings)

## Format for relevant fields
Column numbering starting from 1.
### Raw mapping and validation data
* Odometry x and y, mm (1-2)
* Odometry heading, angles (4)
* Odometry distance, mm (5)
* Magnetometer data, uT scaled by 32 and y and z multiplied by -1 (6-8)
* Time stamp (18)
* Space bar press indicator (17)
### Processed 2Hz SLAM control data
* Forward translation, m (1)
* Heading change, radians (2)
* Magnetic data, uT (3-5)
* Time stamp, s(6)