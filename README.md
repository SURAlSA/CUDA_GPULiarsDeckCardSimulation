# Liar's Deck Valid Card Simulation (Using CUDA and a Nvidia GPU)

**Liar's Deck Valid Card Simulation** is a Nvidia CUDA application designed to analyze the probabilities in the card game *Liar's Deck*, featured in the Steam game *Liar's Bar*. This simulation helps determine the expected number of valid cards a player may receive by running large-scale simulations efficiently using a GPU that supports CUDA.

---

## Features

- **Simulates Liar's Deck games** to analyze probability distributions.
- **Counts occurrences** of hands containing 0 to 5 valid cards.
- **Provides statistical insights** into expected player outcomes.
- **GPU execution** for faster and more efficient processing.

---

## Installation & Usage

### Compilation
To compile the simulation, run the Makefile using the command `make`.

### Running the Simulation
Once compiled, execute the program from the terminal (example runs the simulation 500 times using multiple threads):

`./GPULiarsDeckCardSimulation_Bombo-v1.0.0.exe 10000000000`

The program will output statistical data summarizing the results of the simulations.

---

## Additional Information
- For the official rules of *Liar's Deck*, refer to the *Liar's Bar* Steam page or online sources.
- This project is purely for probability analysis and does not replicate the full game mechanics.

---

## Author
- **Zane Miller (Surai)** - Creator & Maintainer  
  [GitHub Profile](https://github.com/SURAlSA)

## Inspiration
This program was inspired by some code that I was sent by **James Young**. I took inspiration from his code and implemented optimisations such as using Fisher-Yates Shuffle for Card Placement, Bitmask Representation for Deck, and Atomic Operations for Result Storage. Check out his work at his GitHub profile.
- **James Young** - Inspiration
  [GitHub Profile](https://github.com/jamesy0ung)
