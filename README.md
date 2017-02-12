# ggseqlogo
The R package **ggseqlogo** is developed for efficiently generating sequence logo figures based on [ggplot2](http://ggplot2.org),
so that the functions provided by ggplot2 and third-party packages for ggplot2 can be effectively used.

- Functions for generating A, C, G, T character polygons are largely extracted from [**seqLogo**](https://www.bioconductor.org/packages/release/bioc/html/seqLogo.html) package.


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
You can play with ggplot functions and themes.
Also, you can change the colors of A, C, G and T.
```
M <- matrix(rgamma(20, 1, 10), 4, 5)
ggseqlogo(M)
ggseqlogo(M, is.scale = TRUE) + theme_bw()
ggseqlogo(M, is.scale = TRUE) + theme_classic() + labs(x = "Sequence Num", y = "Prob.")
ggseqlogo(M, is.scale = TRUE, A_col = "green", C_col = "blue", G_col = "orange", T_col = "red") + theme_minimal()
```
