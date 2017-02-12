# ggseqlogo
The R package **ggseqlogo** is developed for efficiently generating sequence logo figures based on [ggplot2](http://ggplot2.org),
so that the functions provided by ggplot2 and third-party packages for ggplot2 can be effectively used.

## Usage

### Install the package
First, install **devtools** for installation of **ggseqlogo**.
ALso, install **ggplot2** in case you haven't installed that yet.

```
install.packages("devtools")
install.packages("ggplot2")
```

Currently, the only way for installing **ggseqlogo** is to use **devtools**:
  
```
library(devtools)
devtools::install_github("friend1ws/ggseqlogo")
library(ggseqlogo)
```

### Example

You only need to prepare a DNA frequency matrix (4 * sequence size).
The four rows are frequencies of A, C, G, and T nucleotides, respectively.
Then, you are all set!

```
M <- matrix(rgamma(20, 1, 10), 4, 5)
ggseqlogo(M, is.scale = TRUE)
```
