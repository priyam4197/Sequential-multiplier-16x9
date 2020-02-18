# Sequential-multiplier-16x9
Sequential implementation of 16x9 magnitude multiplier is done on Verilog. 
### Objective
To reduce processing logic by time-sharing a single instance of processing logic to perform multiple processing operations (with different inputs) in different intervals of time (defined by different clock cycles)
At the end of a clock cycle will need to store the result of processing done during the clock cycle – lest we lose them, because inputs to the processing logic will change at the start of the next clock cycle
### Implementation
