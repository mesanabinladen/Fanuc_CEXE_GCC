/* Definition file of SRAM variables.(optional)
Defines the variables which should be allocated into SRAM(static memory)
area.
The variables defined in this file also can be accessed from all tasks. Be sure to
define only the variables, but not the functions.
SRAM variables must have the initial values. The initial values are necessary to
allocate the variables into SRAM area and not effective in the execution time of
the application program.*/

short sramfoo = 0;

