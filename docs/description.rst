A common clock control the reading and writing activity of a synchronous FIFO. The status unit of a synchronous FIFO is simplified because a simple up-down counter can be controlled by the common clock to monitor the gap between the pointers and detect full and empty conditions.

On the other hand, two independent clocks having different frequency and/or phase separately control the read and write pointers of an asynchronous FIFO. Consequently, an up/down counter, which can be controlled by only a single clock, cannot be used to monitor the gap between the pointers. Generation of the critical status flags (stk_full and stk_empty) of an asynchronous FIFO requires a more elaborate status unit.

