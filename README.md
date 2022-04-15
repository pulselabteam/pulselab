# Pulselab
"PulseLab" is the first comprehensive MATLAB toolbox that covers all the necessary steps for estimating the blood pressure from raw electrocardiogram (ECG) and photoplethysmogram (PPG) signals, using pulse wave velocity (PWV)-based models. The toolbox includes a user-friendly graphical user interface (GUI) offering visualization for step-by-step processing of physiological signals (including various measures and metrics), thereby, helping to obtain the most accurate model for blood pressure estimation.

A quick starter guide to run PulseLab after cloning the repository:

1. Launch MATLAB R2019b. Note that the current version of PulseLab only runs on Windows

2. Locate the "PulseLab" folder

3. Add the "PulseLab" folder to path: Add to Path -> Selected Folders and Subfolders

4. Open the "PulseLab" folder in MATLAB and see "PulseLab.m" in the "Current Folder" window

5. In "Command Window", type "PulseLab", and the GUI should open

6. In the "File Load" panel on the top-left of the GUI, click on the "Browse" button. In the pop-up window, select the "Example_Dataset" folder and click "Select Folder"

7. In the "File Load" panel, confirm that the "Saved Setting" is selected as "Example_Config", and click the "Load" button on the right of it

8. You should be able to see waveforms appearing on the left half of the GUI

11. Via the "Individual BP Fitting" tab on the right half of the GUI, a PAT-BP model can be chosen. By clicking on the “Evaluate & Plot” button, the “Regression Metrics” and plots should show up

For more information and advanced applications of PulseLab, watch our [tutorial](https://www.youtube.com/watch?v=4qaiBhuZwtI) on YouTube.

Visit our website at [PulseLab](https://sites.google.com/view/pulselab/home).

If you find this toolbox to be any useful, please consider citing the following paper:

**PulseLab: An Integrated and Expandable Toolbox for Pulse Wave Velocity-based Blood Pressure Estimation**

```
@inproceedings{wang2021pulselab,
  title={PulseLab: An Integrated and Expandable Toolbox for Pulse Wave Velocity-based Blood Pressure Estimation},
  author={Wang, Weinan and Mohseni, Pedram and Kilgore, Kevin and Najafizadeh, Laleh},
  booktitle={43rd Annual International Conference of the IEEE Engineering in Medicine \& Biology Society (EMBC)},
  pages={5654--5657},
  year={2021},
}
````
# Updates
[4/14/2022] When using the plotting functions on the right hand panel, the GUI now also dumps the Reference SBP and DBP, Estimated SBP and DBP, and PAT values used for generating the GUI plots to the MATLAB workspace. These data are organized as structs or struct arrays
- Individual_Fitting_Results: The struct containing data used to plot the figures in the "Individual BP Fitting" Tab
- Overall_Fitting_Results: The struct or struct array containing data used to plot the figures in the "Overall BP Fitting" Tab, organized with respect to each testing subject
- Specific_Fitting_Results: The struct or struct array containing data used to plot the figures in the "Specific Model Testing" Tab, organized with respect to each testing subject
