Compact Experiment 1 & Compact Experiment 2 -> The experiments in which the questions contaions single subject questions used for data extraction.
Compact Experiment 3 -> The experiment in which the questions contains a group of subjects, used for neurofeedback task.
dataSeperator -> Just a function that seperates the given whole data to electrodes.
extractFuncN -> Given the set of questions of two types, calculates the accuracy of the PCA.
extractFuncScriptN -> Script that calls the extractFuncN for all possible combinations.
pcaNew -> PCA function that does the PCA operation.
ICAwithoutFT -> Given the whole raw data, does ICA.
SoleFT -> Given the seperated data read from electrodes, does signal processing including FT.