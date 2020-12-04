# pagedown

O pacote __pagedown__ formata documentos de html gerados por __rmarkdown__ usando templates CSS.
Uma das opções é `pagedown::thesis_paged`, que pode ser criada nos menus de `arquivo novo > from template > html thesis`. 
Esta opção também pode ser usada acrescentando `pagedown::thesis_paged` ao cabeçaho YAML do documento `.Rmd`, assim: 

```yaml
output:
  html_document: pagedown::thesis_paged
```

Esses documentos formatados têm um template CSS com algumas das opções e uma estrutura do documento em um template de html. Para personalizar um documento de html de __pagedown__ você precisa editar estes dois arquivos, `thesis.css` e `thesis.html`, __dentro dos arquivos do pacote__. Nos arquivos de exemplo, mudamos apenas a fonte para Times New Roman (a original é Trébuchet), e traduzimos algumas partes em inglês para o português. 

O documento criado por `arquivo novo > from template > html thesis` mostra algumas opções de cabeçalho YAML para criar este tipo de documento.


