# CPE523 - Lab 2: Sklansky Adder
Dylan Sandall
10/22/2024
## Testing & Validation
	All SystemVerilog modules and testbenches are included in the github repository. Each module was tested with all possible input combinations for 8 bit A and B, and the module outputs (SUM and Carry) were compared to desired results. Refer to (github_repo)/CPE442_Sklanksy_adder.srcs/sim_1/new/testbench.sv for full test suite. 
### RCA
+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |    8 |     0 |          0 |     20800 |  0.04 |
|   LUT as Logic          |    8 |     0 |          0 |     20800 |  0.04 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Flip Flop |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Latch     |    0 |     0 |          0 |     41600 |  0.00 |
| F7 Muxes                |    0 |     0 |          0 |     16300 |  0.00 |
| F8 Muxes                |    0 |     0 |          0 |      8150 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+

Data Path Delay:        10.973ns  (logic 4.981ns (45.392%)  route 5.992ns (54.608%))

+----------------+-----------+----------+-----------+-----------------+
| On-Chip        | Power (W) | Used     | Available | Utilization (%) |
+----------------+-----------+----------+-----------+-----------------+
| Clocks         |     0.000 |        3 |       --- |             --- |
| Slice Logic    |    <0.001 |       12 |       --- |             --- |
|   LUT as Logic |    <0.001 |        8 |     20800 |            0.04 |
| Signals        |    <0.001 |       29 |       --- |             --- |
| I/O            |     0.005 |       26 |       106 |           24.53 |
| Static Power   |     0.070 |          |           |                 |
| Total          |     0.076 |          |           |                 |
+----------------+-----------+----------+-----------+-----------------+





### Sklansky Adder
+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |   11 |     0 |          0 |     20800 |  0.05 |
|   LUT as Logic          |   11 |     0 |          0 |     20800 |  0.05 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Flip Flop |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Latch     |    0 |     0 |          0 |     41600 |  0.00 |
| F7 Muxes                |    0 |     0 |          0 |     16300 |  0.00 |
| F8 Muxes                |    0 |     0 |          0 |      8150 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+

Data Path Delay:        9.152ns  (logic 3.888ns (42.483%)  route 5.264ns (57.517%))

+----------------+-----------+----------+-----------+-----------------+
| On-Chip        | Power (W) | Used     | Available | Utilization (%) |
+----------------+-----------+----------+-----------+-----------------+
| Clocks         |     0.000 |        3 |       --- |             --- |
| Slice Logic    |    <0.001 |       15 |       --- |             --- |
|   LUT as Logic |    <0.001 |       11 |     20800 |            0.05 |
| Signals        |    <0.001 |       31 |       --- |             --- |
| I/O            |     0.005 |       25 |       106 |           23.58 |
| Static Power   |     0.070 |          |           |                 |
| Total          |     0.076 |          |           |                 |
+----------------+-----------+----------+-----------+-----------------+








### + Adder
+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |    8 |     0 |          0 |     20800 |  0.04 |
|   LUT as Logic          |    8 |     0 |          0 |     20800 |  0.04 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Flip Flop |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Latch     |    0 |     0 |          0 |     41600 |  0.00 |
| F7 Muxes                |    0 |     0 |          0 |     16300 |  0.00 |
| F8 Muxes                |    0 |     0 |          0 |      8150 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+

  Data Path Delay:        8.561ns  (logic 4.711ns (55.033%)  route 3.850ns (44.967%))

+----------------+-----------+----------+-----------+-----------------+
| On-Chip        | Power (W) | Used     | Available | Utilization (%) |
+----------------+-----------+----------+-----------+-----------------+
| Clocks         |     0.000 |        3 |       --- |             --- |
| Slice Logic    |    <0.001 |       13 |       --- |             --- |
|   LUT as Logic |    <0.001 |        8 |     20800 |            0.04 |
|   CARRY4       |    <0.001 |        3 |      8150 |            0.04 |
|   Others       |     0.000 |        2 |       --- |             --- |
| Signals        |    <0.001 |       27 |       --- |             --- |
| I/O            |     0.006 |       25 |       106 |           23.58 |
| Static Power   |     0.070 |          |           |                 |
| Total          |     0.076 |          |           |                 |
+----------------+-----------+----------+-----------+-----------------+




## Results
Looking at the results, the best critical path timing was achieved by the Vivado optimized + operator. While it uses the same number of LUTs as the RCA, it also makes use of the CARRY4 logic within the used slices, which appear to be some optimized logic for the express purpose of addition. Power consumption is very close between all methods, with Sklansky falling in last due to increased LUT usage. 
While in this case, the Sklansky adder is not as good as the Vivado + operator, in a true VLSI design, it may be the best option. Area, power, and delay work differently in FPGA-land, and the Vivado + operator would not benefit from the CLOCK4 logic in the same way. Since our Sklansky adder would not be hampered by the overhead of FPGA routing and slice mapping, it would likely be better when compared head to head directly on a silicon die.
In summary, for FPGA designs, the optimized Vivado library is often the best choice, as it benefits from specialized logic that is not accessible to the Sklansky design. In an IC, the Sklansky adder would be the superior design. The RCA has the least area usage, but depending on performance needs and area constraints, it would likely be the worst option.
