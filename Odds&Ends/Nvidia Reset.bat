@echo off
net stop NVDisplay.ContainerLocalSystem
net stop NvContainerLocalSystem
net start NVDisplay.ContainerLocalSystem
net start NvContainerLocalSystem