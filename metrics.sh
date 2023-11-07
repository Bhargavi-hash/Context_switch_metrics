#!/bin/bash

# Record the current time in nanoseconds
start_time=$(date +%s%N)

# Simulate a context switch by running a sleep command (you may need to adjust the sleep duration)
sleep 1

# Record the time again after the sleep
end_time=$(date +%s%N)

time_taken=$((end_time - start_time))

# Get the number of context switches in the last minute
context_switches=$(cat /proc/stat | grep ctxt | awk '{print $2}')
# Calculate the estimated time taken for a single context switch in nanoseconds
if [ $context_switches -gt 0 ]; then
    time_per_context_switch=$((time_taken / context_switches))
else
    time_per_context_switch=0
fi


context_switches_per_second=$((context_switches / 60))

# Get the total number of processes on the system
total_processes=$(ps aux | wc -l)

# Get the number of interrupts in the last minute
interrupts=$(cat /proc/interrupts | grep -c '^[0-9]')

# Get the number of traps in the last minute
traps=$(cat /proc/stat | grep 'intr' | awk '{print $2}')

# Get the number of I/O requests in the last minute
io_requests=$(cat /proc/diskstats | awk '{s+=$10} END {print s}')

# Display the results in a table
echo -e "Metric\t\t\tValue"
echo -e "------\t\t\t-----"
echo -e "Context Switches\t$context_switches"
echo -e "Context Switches per Second\t$context_switches_per_second"
echo -e "Time per Context Switch (ns)\t$time_per_context_switch"
echo -e "Total Processes\t\t$total_processes"
echo -e "Interrupts\t\t$interrupts"
echo -e "Traps\t\t\t$traps"
echo -e "I/O Requests\t\t$io_requests"

