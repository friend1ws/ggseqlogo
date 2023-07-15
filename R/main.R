#' Generate a ggplot object of sequence logos from the DNA frequency matrices.
#'
#' @param M The DNA frequency matrices (4 * sequence lengths matrices).
#' @param is.scale whether heights are scaled according to information contents or not.
#' @param A_col The color for the "A" character.
#' @param C_col The color for the "C" character.
#' @param G_col The color for the "G" character.
#' @param T_col The color for the "T" character.
#' @return a ggplot object of sequence logos
#' @examples ggseqlogo(matrix(rgamma(20, 1, 10), 4, 5), is.scale = TRUE)
#' @export
ggseqlogo <- function(M, is.scale = FALSE, A_col = "#00BA38", C_col = "#619CFF", G_col = "#B79F00", T_col = "#F8766D") {

  M <- sweep(M, 2, colSums(M), FUN="/")

  if (is.scale) {
    for (i in 1:ncol(M)) {
      ic <- 2 + sum(sapply(M[, i], function(x) {ifelse(x > 0, x*log2(x), 0)}))
      M[, i] <- M[, i] * ic
    }
  }

  letter_data <- c()
  for(i in 1:ncol(M)) {
    cur_y <- 0
    cur_id <- 8 * (i - 1)

    letter_order <- order(M[,i])
    for(tl in letter_order) {
      if (tl == 1) {
        letter_data <- rbind(letter_data, letter_A(i - 0.49, cur_y, 0.97 * M[1, i], 0.98, cur_id))
        cur_y <- cur_y + 0.97 * M[1, i] + 0.01
      } else if (tl == 2) {
        letter_data <- rbind(letter_data, letter_C(i - 0.49, cur_y, 0.97 * M[2, i], 0.98, cur_id + 2))
        cur_y <- cur_y + 0.97 * M[2, i] + 0.01
      } else if (tl == 3) {
        letter_data <- rbind(letter_data, letter_G(i - 0.49, cur_y, 0.97 * M[3, i], 0.98, cur_id + 4))
        cur_y <- cur_y + 0.97 * M[3, i] + 0.01
      } else if (tl == 4) {
        letter_data <- rbind(letter_data, letter_T(i - 0.49, cur_y, 0.97 * M[4, i], 0.98, cur_id  +6))
        cur_y <- cur_y + 0.97 * M[4, i] + 0.01
      } else {
        stop("tl must be any of 1 to 4")
      }
    }
  }

  ggplot(letter_data, aes(x = x, y = y, group = id, fill = fill)) +
    geom_polygon() +
    scale_fill_manual(values = c("A" = A_col, "C" = C_col, "G" = G_col, "T" = T_col, "white" = "#FFFFFF")) +
    guides(fill = "none") +
    labs(x = "Position", y = "Probability")

}


