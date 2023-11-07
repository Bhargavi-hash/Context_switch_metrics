# View your system and context switch metrics using this

The above bash script gives you a basic idea of the number of context switches and interrupts per minute on your system. Run the below command to check them on your system.

## Steps to run it on your system.

* Download the repo into your local system. The folder will be saved as `Context_swicth_metrics`.
* Open the terminal in this folder and run the `make` command first. This will setup the required environment to collect and display the data.
* Once this is done, run the `./metrics.sh` command. This will display the data of context switches, interrupts and traps in the last one minute on your local system.
