# Pulselab
"PulseLab'', is the first comprehensive MATLAB toolbox that covers all the necessary steps for estimating the blood pressure from raw electrocardiogram (ECG) and photoplethysmogram (PPG) signals, using pulse wave velocity (PWV)-based models. The toolbox includes a user-friendly graphical user interface (GUI) offering visualization for step-by-step processing of physiological signals (including various measures and metrics), thereby, helping to obtain the most accurate model for blood pressure estimation.

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

For more information and advanced applications of PulseLab, watch our [tutorial](https://www.youtube.com/watch?v=4qaiBhuZwtI) on YouTube
