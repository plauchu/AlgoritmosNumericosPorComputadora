# Calculating voltage using Kirchhoff loops

Kirchhoff's laws are widely used in electrical engineering to find currents or voltages in closed circuits. Ohm's Law (`V = I * R`) is used to write equations representing each loop in the circuit. As was discussed in class, these equations can be used to build a system of linear equations that can then be solved using linear algebra. For example,

![Matrix Kirchhoff](../images/matrix_kirchhoff.jpg)

For this problem, you have been provided the circuit shown below. Use Kirchhoff loops to create a system of equations. Arrange your equations so that the voltages are all positive. Solve for the current `I` using the current loop directions defined for `I`<sub>`a`</sub>, `I`<sub>`b`</sub> and `I`<sub>`c`</sub> below.

![Matrix Kirchhoff](../images/kirchhoff.png)

Your solution should:

1. Create a variable named `v` that contains the voltage (in Volts) for loop `I`<sub>`a`</sub> in the first row, loop `I`<sub>`b`</sub> in the second, and loop `I`<sub>`c`</sub> in the third.

2. Create a variable named `R` that contains the equation coefficients (in Ohms). Place coefficients for current `I`<sub>`a`</sub> in the first column, `I`<sub>`b`</sub> in the second, and `I`<sub>`c`</sub> in the third. Place the equation for loop `I`<sub>`a`</sub> on the first row, `I`<sub>`b`</sub> on the second, and `I`<sub>`c`</sub> on the third.

3. Solve the set of linear equations for current (in Amps) and store the result in a variable named `I`.

4. Calculate the voltage drop across the `8Ω` resistor between nodes `c` and `f` using Ohm's Law and the loop currents solved for previously. Assign the value to a variable named `Vcf`.

```matlab
% Voltages
V = [9 ; 1.5 ; 3]; % Volts

% Equation coefficients
R = [(6 + 2 + 10), -2, 0 ; -2, (2 + 1 + 8), -8 ; 0, -8, (9 + 5 + 8)]; % Ohms

% Solve for current
I = R \ V;

% calculate Vout
Vcf = 8 * (I(2) - I(3)); % units of Volts
```