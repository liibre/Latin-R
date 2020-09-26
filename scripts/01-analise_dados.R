# Script para fazer download dos dados e gerar tabelas e figuras

# Bibliotecas necessárias
library(palmerpenguins)
library(ggplot2)
library(dplyr)

# Carregando os dados ----------------------------------------------------------
head(penguins)

# Criando a figura -------------------------------------------------------------
# Definindo vetor de cores 'oficial'
cores <- c("darkorange", "purple", "cyan4")

p1 <- penguins %>%
  na.omit() %>%
  mutate(sex = ifelse(sex == "female", "Fêmea", "Macho")) %>%
  ggplot(aes(x = sex, y = body_mass_g, fill = species)) +
  scale_fill_manual(values = cores, name = "Espécie",
                     labels = c(expression(italic("P. adelie")),
                                expression(italic("P. chinstrap")),
                                expression(italic("P. gentoo")))) +
  geom_boxplot() +
  #facet_wrap(~ species) +
  labs(x = "Sexo", y = "Massa corpórea (g)") +
  theme_classic()

png("figs/figura_02.png", res = 300, height = 700, width = 1200)
p1
dev.off()

# Criando tabela ---------------------------------------------------------------
# vetor com as variáveis para a tabela
variables <- c("bill_length_mm", "bill_depth_mm", "flipper_length_mm")

# Calculando a média e o desvio padrão para cada variável
df <- penguins %>%
  na.omit() %>%
  group_by(species) %>%
  select(one_of(variables)) %>%
  summarise_all(list(mean = mean, sd = sd)) %>%
  mutate_if(is.numeric, round, digits = 2)

# Criando a tabela para o manuscrito
table <- data.frame(sp = paste("P.", tolower(df$species), sep = ""))

for (i in 1:length(variables)) {
  table[, variables[i]] <- apply(df[, grep(variables[i], names(df))], 1,
                                 paste, collapse = " ± ")
}

# Exportando a tabela
write.csv(table, "output/tabela_01.csv", row.names = FALSE)

