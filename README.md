![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# Tiny Tapeout Verilog Project Template

- [Read the documentation for project](docs/info.md)

## Clock frequency Rivider ROM controled

This project is based on the necessity to have different clock frequencies for designing real-time clocks, using microprocessors, microcontrollers, or other devices.
# Block diagram

<p align="center">
  <img src="block_diagram.svg" alt="Block Diagram" width="1200">
</p>

As we can see in the block diagram this project is compose of two parts, one being a ROM for frequency select, this ROM cointains the necesari parameters to divide the clock input. The second part is a counter to devide the input clk frequency.

## ROM
This ROM contains the nesesaria parameters to select the frequency needed out of 27 frecuencies, the calculus of parameters is base on the next formula:

Where:
- `F_{clk_{in}}` = Frequency of the input clock (in Hz)
- `F_{clk_{out}}` = Frequency of the output clock (in Hz)
- DIVISOR = Parameter value used to divide the input clock frequency


- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

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
