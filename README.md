# Escrevendo manuscritos acadêmicos usando rmarkdown

Esta oficina vai mostrar os diferentes passos e ferramentas para escrever manuscritos acadêmicos ou relatórios técnicos de forma automatizada e reprodutível usando R e rmarkdown. Iremos abordar os seguintes temas: estrutura de um documento de rmarkdown, estrutura de pastas, fluxos de trabalho de um projeto de escrita, boas práticas de programação em R, citação (arquivos .bib) e gestores de bibliografia, formatação e integração com editores de texto tradicionais e LaTeX. A oficina será dividida em uma parte conceitual e uma parte prática. O objetivo é que todas as pessoas participantes finalizem a oficina com um documento de texto gerado a partir de um arquivo Rmd contendo texto, uma figura, uma tabela e referências bibliográficas.

## Requerimentos necessários
Os participantes deverão instalar os pacotes rmarkdown, knitr e kableExtra, remedy e palmerpenguins e os programas [Pandoc](https://pandoc.org/installing.html) e [Zotero](https://www.zotero.org/), ou qualquer outro gestor de bibliografia, como Mendeley ou EndNote.

## Estrutura de pastas deste projeto
    .
    ├── citation/ # arquivos .bib
    ├── data/     # dados
    ├── exemplo/  # arquivo .Rmd
    ├── figs/     # figuras geradas pelos scripts
    ├── output/   # outputs gerados pelos scripts
    └── scripts/  # scripts de R com análises

A oficina será ministrada por Andrea Sánchez-Tapia e Sara Ribeiro Mortara. 

**Andrea Sánchez-Tapia**. Bióloga, Pesquisadora pós-doutoral do Núcleo de Computação Científica e Geoprocessamento do Jardim Botânico do Rio de Janeiro. Co-fundadora de ¡liibre! - laboratório independente de informática da biodiversidade e reprodutibilidade em ecologia. Co-organizadora do capítulo RLadies+ Rio de Janeiro.

**Sara Ribeiro Mortara**. Bióloga, doutora em Ecologia e pesquisadora do Instituto Internacional para Sustentabilidade. Trabalha com ciência de dados e biodiversidade. É co-fundadora do ¡liibre! - laboratório independente de informática da biodiversidade e reprodutibilidade em ecologia e co-organizadora do capítulo R-Ladies+ Rio de Janeiro.
