# Script para fazer um mapa de bônus :)

# Bibliotecas necessárias
library(palmerpenguins)
library(ggplot2)
library(sf)
library(ggspatial)
library(cowplot)
library(magick)

# Carregando os dados ----------------------------------------------------------
## Dados dos penguins
head(penguins)

## Download do Shapefile da Antartica direto do GADM
cod <- "ATA" # Codigo iso3 do pais Antarctica
level <- 0 # para download do maior nivel do pais (sem subdivisoes)
file <- paste0(cod, "_", level, "_sf.rds")
destfile <- paste0("./data/GADM/", file)
# Se o arquivo não foi baixado, faz o download e salva na pasta data/GADM
if (!file.exists(destfile)) {
  url <- paste0("https://biogeo.ucdavis.edu/data/gadm3.6/Rsf/gadm36_", file)
  download.file(url, destfile = destfile)
}

# Carregando o objeto para o R
ata <- readRDS(destfile)

# Coordenadas das ilhas
coord <- data.frame(Ilha = c('Biscoe', 'Torgersen', 'Dream'),
                    lon = c(-63.766667, -64.066667, -64.216667),
                    lat = c(-64.800000, -64.766667, -64.716667))

# Caminho para figuras dos pinguins
adelie <- "figs/adelie.png"
chinstrap <- "figs/chinstrap.png"
gentoo <- "figs/gentoo.png"

# Objeto para cores das espécies
especies <-  data.frame(dummy = c(0, 0, 0),
                        cores = c("darkorange", "purple", "cyan4"),
                        especie = c("P. adelie", "P. chinstrap", "P. gentoo"))

# Criando o mapa ---------------------------------------------------------------
penguin_map <- ggplot() +
  geom_sf(data = ata) +
  #  coord_sf(crs = polar_proj) +
  #coord_sf(xlim = c(-68, -55), ylim = c(-66, -60)) +
  coord_sf(xlim = c(-66, -60), ylim = c(-65, -63)) +
  geom_segment(data = coord, aes(x = lon,  xend = lon - c(0, 0.7, 1),
                                 y = lat, yend = lat + c(1, 0.7, 0))) +
  geom_point(data = coord, aes(x = lon, y = lat, shape = Ilha),
             size = 2) +
  annotation_scale(location = "bl", width_hint = 0.5,
                   pad_x = unit(2.75, "in"),
                   pad_y = unit(0.25, "in")) +
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(0.15, "in"),
                         pad_y = unit(2.72, "in"),
                         style = north_arrow_fancy_orienteering) +
  xlab("Longitude") + ylab("Latitude") +
  geom_point(aes(x = dummy, y = dummy, color = especie), data = especies) +
  scale_color_manual(values = especies$cores, name = "Espécie",
                     labels = c(expression(italic("P. adelie")),
                                expression(italic("P. chinstrap")),
                                expression(italic("P. gentoo")))) +
  theme_minimal()  +
  theme(legend.text.align = 0)

penguin_map

# Adicionando figuras dos pinguins nos mapas -----------------------------------
all_map <- ggdraw() +
  draw_plot(penguin_map) +
  draw_image(adelie,  x = -0.12, y = 0.1, scale = .1) +
  draw_image(gentoo,  x = -0.12, y = 0.01, scale = .1) +
  draw_image(adelie,  x = -0.25, y = 0, scale = .1) +
  draw_image(adelie,  x = -0.31, y = -0.175, scale = .1) +
  draw_image(chinstrap,  x = -0.31, y = -0.265, scale = .1)

# Salvando o mapa
png("figs/figura_01.png", res = 300, width = 2000, height = 1300)
all_map
dev.off()
