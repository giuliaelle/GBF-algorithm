# GBF Algorithm

Welcome to the **GBF Algorithm** project! This repository implements the Gaussian mixture model (GBF) algorithm for computing the sign-changing roots of a given Gaussian mixture. Additionally, it provides symbolic expressions for GBF sequences based on the number of Gaussian components.

---

## GBF Algorithm Overview

The **GBF Algorithm** is used to find the roots of a mixture of Gaussian functions. The primary function to run is `Roots_GBF`, which returns the sign-changing roots of the Gaussian mixture and generates a descriptive plot.

### Input Parameters

To run the `Roots_GBF` function, the following input parameters are required:

- `n`: Dimension of the mixture (number of Gaussians involved)
- `lambda`: Mixing coefficients or weights for the Gaussians
- `mu`: Means of the Gaussian components
- `s`: Variances of the Gaussian components
- `eps`: Accuracy level for the root-finding algorithm

### How to Run

1. Define the input parameters (`n`, `lambda`, `mu`, `s`, `eps`).
2. Call the **Matlab function** `Roots_GBF`.
   
   The function will return the eventual sign-changing roots of the mixture and produce a plot of the result.

---

## Symbolic GBF Sequence

Symbolic expressions for **GBF sequences** are available in the `DB_GBF_n` files, where `n` corresponds to the number of Gaussian components in the mixture. 

---

## Demo and Testing

To test the algorithm and see examples in action, run the **`Demo.m`** file. This file Demonstrates how to set up and use the GBF algorithm with predefined parameters. Simply open and run `Demo.m` in Matlab to observe how the algorithm works.

---

## How to Use

1. Clone or download this repository.
2. Open Matlab and navigate to the folder where the files are located.
3. Run the `Roots_GBF` function with your defined parameters.
4. To explore predefined examples, run `Demo.m`.

---
