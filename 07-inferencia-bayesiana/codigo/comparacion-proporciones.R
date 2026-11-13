# Código transcrito del documento original; lógica académica sin corregir.
#Librerías
library(ggplot2)

# número de muestra
n_est <- 100
n_prof <- 30

# número de aciertos de la muestra
clicks_est <- 45
clicks_prof <- 5

# proporciones
prop_est <- clicks_est / n_est
prop_prof <- clicks_prof / n_prof

# Datos para a y b (estudiantes STEM) / Evolución de la participación en la Matrícula de 1er año pregrado en carreras o programas STEM y brechas de género
r1_est <- 19.7 / 100
r2_est<- 20.8 / 100

# Construcción params

# A priori
a_est_priori <- (r1_est * (1 - r2_est)) / (r2_est - r1_est)
b_est_priori <- ((1 - r1_est) * (1 - r2_est)) / (r2_est - r1_est)

# Posteriori
a_est_post <- a_est_priori + clicks_est
b_est_post <- b_est_priori + n_est - clicks_est


# Datos para a y b (docentes mujeres) /  Evolución N° de Académicas/os Únicas/os, según sexo
r1_prof <- 45.47 / 100
r2_prof <- 45.67 / 100

# Construcción params

# a priori
a_prof_priori <- (r1_prof * (1 - r2_prof)) / (r2_prof - r1_prof)
b_prof_priori <- ((1 - r1_prof) * (1 - r2_prof)) / (r2_prof - r1_prof)

# Posteriori
a_prof_post <- a_prof_priori + clicks_prof
b_prof_post <- b_prof_priori + n_prof - clicks_prof

# Realizar la simulación
n_sim <- 100000

priori_est <- rbeta(n_sim, shape1 = a_est_priori,
                    shape2 = b_est_priori)

priori_prof <- rbeta(n_sim, shape1 = a_prof_priori,
                     shape2 = b_prof_priori)
                       
post_est <- rbeta(n_sim, shape1 = a_est_post,
                        shape2 = b_est_post)

post_prof <- rbeta(n_sim, shape1 = a_prof_post,
                          shape2 = b_prof_post)

# diferencia de proporciones

# Hipótesis 1: P(prop_est > prop_prof) => P(prop_est - prop_prof > 0)

# a prior
diff_priori_1 <- priori_est - priori_prof
prob_diff_priori_1 <- mean(diff_priori_1 > 0) 
lower_percentile01 <- quantile(diff_priori_1, 0.025)
upper_percentile01 <- quantile(diff_priori_1, 0.975)

cat("La probabilidad de P(prop_est > prop_prof): ", prob_diff_priori_1, "\n")
cat("Intervalo de predicc, limite inferior:", lower_percentile01, "\n")
cat("Intervalo de predicc, limite superior:", upper_percentile01, "\n")

# a posteriori
diff_posterior_1 <- post_est - post_prof
prob_diff_posterior_1 <- mean(diff_posterior_1 > 0) 
lower_percentile1 <- quantile(diff_posterior_1, 0.025)
upper_percentile1 <- quantile(diff_posterior_1, 0.975)

cat("La probabilidad de P(prop_est > prop_prof ∣ datos)",prob_diff_posterior_1, "\n")
cat("Intervalo de predicc, limite inferior:", lower_percentile1, "\n")
cat("Intervalo de predicc, limite superior:", upper_percentile1, "\n")

# Odds a priori
odds_diff_priori_1 <- prob_diff_priori_1 / (1 - prob_diff_priori_1)
# Odds a posteriori
odds_diff_posterior_1 <- prob_diff_posterior_1 / (1 - prob_diff_posterior_1)
# Factor Bayes
fb_diff_1 <- odds_diff_posterior_1 / odds_diff_priori_1

cat("El odds a priori es: ", odds_diff_priori_1, "\n")
cat("El odds a posteriori es: ", odds_diff_posterior_1, "\n")
cat("El factor bayes es: ", fb_diff_1, "\n")

# Graficar
df_diff <- data.frame(
  Diferencia = c(diff_priori_1, diff_posterior_1),
  Distribución = rep(c("Prior", "Posterior"), each = n_sim)
)
# Umbral para la hipótesis
umbral <- 0

# Graficar densidades con sombreado
ggplot(df_diff, aes(x = Diferencia, fill = Distribución, color = Distribución)) +
  geom_density(alpha = 0.3) +
  geom_vline(xintercept = umbral, linetype = "dashed", color = "black") +
  annotate("text", x = umbral + 5, y = 0.01, label = "Umbral = 0", hjust = 0) +
  labs(
    title = "Distribución de la Diferencia entre proporciones",
    subtitle = "Antes y después de observar los datos",
    x = "Diferencia esperada",
    y = "Densidad"
  ) +
  theme_minimal()



# Hipótesis 2: P(prop_est > 3*prop_prof) => P(prop_est - 3*prop_prof > 0)

# a prior
diff_priori_2 <- (priori_est - (3 * priori_prof))
prob_diff_priori_2 <- mean(diff_priori_2 > 0) 
lower_percentile02 <- quantile(diff_priori_2, 0.025)
upper_percentile02 <- quantile(diff_priori_2, 0.975)

cat("La probabilidad de P(prop_est > 3*prop_prof): ", prob_diff_priori_2, "\n")
cat("Intervalo de predicc, limite inferior:", lower_percentile02, "\n")
cat("Intervalo de predicc, limite superior:", upper_percentile02, "\n")

# a posteriori
diff_posterior_2 <- (post_est - (3 * post_prof))
prob_diff_posterior_2 <- mean(diff_posterior_2 > 0) 
lower_percentile2 <- quantile(diff_posterior_2, 0.025)
upper_percentile2 <- quantile(diff_posterior_2, 0.975)

cat("La probabilidad de P(prop_est > 3*prop_prof ∣ datos):",prob_diff_posterior_2, "\n")
cat("Intervalo de predicc, limite inferior:", lower_percentile2, "\n")
cat("Intervalo de predicc, limite superior:", upper_percentile2, "\n")

# Odds a priori
odds_diff_priori_2 <- prob_diff_priori_2 / (1 - prob_diff_priori_2)
# Odds a posteriori
odds_diff_posterior_2 <- prob_diff_posterior_2 / (1 - prob_diff_posterior_2)
# Factor Bayes
fb_diff_2 <- odds_diff_posterior_2 / odds_diff_priori_2

cat("El odds a priori es: ", odds_diff_priori_2, "\n")
cat("El odds a posteriori es: ", odds_diff_posterior_2, "\n")
cat("El factor bayes es: ", fb_diff_2, "\n")


# Graficar
df_diff2 <- data.frame(
  Diferencia = c(diff_priori_2, diff_posterior_2),
  Distribución = rep(c("Prior", "Posterior"), each = n_sim)
)
# Umbral para la hipótesis
umbral <- 0

ggplot(df_diff, aes(x = Diferencia, fill = Distribución, color = Distribución)) +
  geom_density(alpha = 0.3) +
  geom_vline(xintercept = umbral, linetype = "dashed", color = "black") +
  annotate("text", x = umbral + 5, y = 0.01, label = "Umbral = 0", hjust = 0) +
  labs(
    title = "Distribución de la Diferencia entre proporciones",
    subtitle = "Antes y después de observar los datos",
    x = "Diferencia esperada",
    y = "Densidad"
  ) +
  theme_minimal()
