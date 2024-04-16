![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# Clock Frequency Divider ROM Control

- [Read the documentation for project](docs/info.md)

## Clock frequency Rivider ROM controled

This project is based on the necessity to have different clock frequencies for designing real-time clocks, using microprocessors, microcontrollers, or other devices.
# Block diagram

<p align="center">
  <img src="block_diagram.svg" alt="Block Diagram" width="1200">
</p>

As we can see in the block diagram, this project is composed of two parts. One part is a ROM for frequency selection. This ROM contains the necessary parameters to divide the clock input. The second part is a counter to divide the input clock frequency.

## ROM
This ROM contains the nesesaria parameters to select the frequency needed out of 27 frecuencies, the calculus of parameters is base on the next formula:
`Divisor = clk_in / clk_out` 
Where:
- `clk_in` = Frequency of the input clock (in Hz)
- `clk_out` = Frequency of the output clock (in Hz)
- `DIVISOR` = Parameter value used to divide the input clock frequency
This parameter is the one we have on our rom this well drive our counter when we need to divide the frequency.
The next table enlist the parameters and frequencyies to be selected on the ROM:

| Address | Divider | Frequency (Hz) | Period |
| ------- | ------- | ---------------| ------ |
| 0       | 50,000,000 | 1             | 20ns   |
| 1       | 5,000,000  | 10            | 200ns  |
| 2       | 2,500,000  | 20            | 400ns  |
| 3       | 2,000,000  | 25            | 500ns  |
| 4       | 1,000,000  | 50            | 1us    |
| 5       | 500,000    | 100           | 2us    |
| 6       | 250,000    | 200           | 4us    |
| 7       | 200,000    | 250           | 5us    |
| 8       | 100,000    | 500           | 10us   |
| 9       | 66,667     | 750.005       | 13.333us|
| 10      | 50,000     | 1000          | 20us   |
| 11      | 5,000      | 10,000        | 100us  |
| 12      | 2,500      | 20,000        | 50us   |
| 13      | 2,000      | 25,000        | 40us   |
| 14      | 1,000      | 50,000        | 20us   |
| 15      | 665        | 75,188.7      | 13.307us |
| 16      | 500        | 100,000       | 10us   |
| 17      | 250        | 200,000       | 5us    |
| 18      | 200        | 250,000       | 4us    |
| 19      | 100        | 500,000       | 2us    |
| 20      | 65         | 769,231       | 1.3us  |
| 21      | 50         | 1,000,000     | 1us    |
| 22      | 12         | 4,166,667     | 0.24us |
| 23      | 10         | 5,000,000     | 0.2us  |
| 24      | 8          | 6,250,000     | 0.16us |
| 25      | 6          | 8,333,333     | 0.12us |
| 26      | 4          | 12,500,000    | 0.08us |
| 27      | 2          | 25,000,000    | 0.04us |

The ROM is driven by a clock signal and four address select bits. When the reset signal, reset_n, is triggered, the ROM will return to address 0, causing the output to return to 0 until the next rising edge of the clock signal.

### Simulation
Simulation was done using intel quartus prime lite universal wave form

<p align="center">
  <img src="ROM_simulation.PNG" alt="ROM simulation" width="3000">
</p>

As you can see the ROM will give the value selected while reset_n signal is not activated.
## Clock divider
clk_divider, serves to divide an input clock signal (clock_in) by a specified divisor (divisor_input). Upon initialization or when a reset signal (reset_n) is activated, the internal counter (counter) and output clock (clock_out) are reset to zero. Subsequently, on each rising edge of clock_in, the counter increments until it reaches the divisor value minus one. If the divisor input changes, the divisor is updated, and the counter is reset.

For cases where the divisor isn't an exact multiple of 50 MHz (the typical clock frequency), two flip-flops are utilized to synchronize the output clock (clock_out). The first flip-flop toggles when the counter value is less than half of the divisor, while the second flip-flop mirrors the first one to ensure synchronization. This setup ensures proper operation regardless of the input clock's frequency relationship with 50 MHz. However, if the divisor matches 50 MHz precisely, the input clock is directly passed to the output without any manipulation, streamlining the process for exact frequency multiples.

### Simulation
In this simulation, a 25 MHz frequency was selected for demonstration purposes. As depicted in the accompanying image, if the divider is set to 2, the clock signal will be generated every 2 clock cycles with a 50% duty cycle. When the divider is reset, the clock signal will halt until the reset_n signal transitions LOW again.
<p align="center">
  <img src="clk_divider_sim.PNG" alt="Block Diagram" width="1200">
</p>
## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
- [Build your design locally](https://docs.google.com/document/d/1aUUZ1jthRpg4QURIIyzlOaPWlmQzr-jBn3wZipVUPt4)

## What next?

- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Edit [this README](README.md) and explain your design, how it works, and how to test it.
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@matthewvenn](https://twitter.com/matthewvenn)
