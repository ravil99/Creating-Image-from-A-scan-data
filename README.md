# Creating-Image-from-A-scan-data
Hello! This is my research project i have made in 2018-2019 autumn semester.
The goal of my project was create image of an object from A-scan data measured from ultrasonic sensors. So, consider it like ultrasonic flaw detector or ultrasound machine.

Now I will explain how does it work:

01 - 025.mat are MATLAB data files. They contain data sampled from A-scan from ultranonic sensors. Each data file contains signal amplitudes and time when they were measured.
Meausring method and futher data processing was inspired by the Successive Projection Algorithm. If you are interested, I recommend you to read this article: https://pubmed.ncbi.nlm.nih.gov/27879768/

Measurement was made from 5 different ultrasonic sensors in 5 different positions, that why my professor gave me 25 A-scan data. My script reads each data file, builds images of an object from each of 25 A-scans and then summs it. Final picture with this data set is given in "Result.png". The original object was a rectanglular piece of glass with crack in the bottom right part. My picture has warmer colors in bottor right part, which means that my picture correlates with the original one.

Also I have drawn an algorith of my script, but it is in Russian. Hopefully I will translate it into English.

Used software:
- MATLAB

Unfortunately I have decided not to continue this project and started learning FPGA. 

Hope you have found this project interesting!
