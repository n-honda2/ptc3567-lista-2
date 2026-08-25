#set document(title: "Resultados: preços de soja e milho", author: "")
#set page(margin: (x: 2.2cm, y: 2cm))
#set text(lang: "pt", size: 10.5pt)
#set par(justify: true)
#set heading(numbering: none)

= Resultados da análise exploratória

Nicolas Honda \\
NUSP: 12552030

= 1. Caracterização inicial

== 1.1 Tipos dos atributos e qualidade dos dados

Os dados contêm 498 observações diárias, sem valores ausentes ou linhas duplicadas. As datas estão em ordem crescente e abrangem o período de 02/01/2014 a 30/12/2015. Os preços de milho e soja são quantitativos contínuos, expressos em R\$/saca de 60 kg.

#table(
  columns: (auto, 1fr),
  stroke: .5pt + luma(190),
  inset: 7pt,
  table.header([*Indicador*], [*Resultado*]),
  [Observações], [498],
  [Período], [02/01/2014 a 30/12/2015],
  [Variáveis de preço], [Milho e soja, em R\$/saca de 60 kg],
  [Valores ausentes], [Nenhum],
  [Linhas duplicadas], [Nenhuma],
)

#figure(
  image("figuras/serie_temporal.png", width: 100%),
  caption: [Evolução diária dos preços de milho e soja.],
)

== 1.2 Medidas de localidade e dispersão

#table(
  columns: (1.7fr, 1fr, 1fr),
  stroke: .5pt + luma(190),
  inset: 7pt,
  table.header([*Medida*], [*Milho*], [*Soja*]),
  [Média], [R\$ 27,96], [R\$ 66,50],
  [Mediana], [R\$ 27,54], [R\$ 65,17],
  [Desvio-padrão], [R\$ 3,56], [R\$ 5,80],
  [Mínimo], [R\$ 21,76], [R\$ 56,74],
  [Máximo], [R\$ 36,83], [R\$ 79,86],
  [Q1], [R\$ 25,51], [R\$ 62,30],
  [Q3], [R\$ 30,32], [R\$ 69,19],
  [Intervalo interquartil], [R\$ 4,81], [R\$ 6,89],
)

O preço da soja apresentou maior dispersão absoluta, com desvio-padrão de R\$ 5,80, contra R\$ 3,56 para o milho. Em termos relativos à média, a dispersão foi maior no milho: aproximadamente 12,7%, contra 8,7% na soja. As médias superiores às medianas indicam leve assimetria à direita nas duas distribuições, mais evidente na soja.

= 2. Espalhamento e identificação de outliers

== 2.1 Boxplot dos preços

#figure(
  image("figuras/boxplot.png", width: 82%),
  caption: [Boxplots dos preços de milho e soja.],
)

== 2.2 Histogramas e identificação pelo IQR

#figure(
  image("figuras/distribuicoes.png", width: 100%),
  caption: [Distribuições dos preços de milho e soja.],
)

#table(
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  stroke: .5pt + luma(190),
  inset: 7pt,
  table.header([*Variável*], [*Limite inferior*], [*Limite superior*], [*Outliers*], [*Percentual*]),
  [Milho], [18,295], [37,535], [0], [0,00%],
  [Soja], [51,975], [79,515], [3], [0,60%],
)

Não foram identificados outliers no preço do milho. No preço da soja, três observações ultrapassaram o limite superior de R\$ 79,515. Esses registros representam uma parcela pequena da base e não foram removidos da análise.

= 3. Correlação e covariância

== 3.1 Associação entre os preços

#table(
  columns: (1.8fr, 1fr),
  stroke: .5pt + luma(190),
  inset: 7pt,
  table.header([*Medida*], [*Resultado*]),
  [Correlação de Pearson], [0,749],
  [Covariância amostral], [15,494],
)

A correlação de Pearson de 0,749 indica associação linear positiva forte no período observado: dias com preços de milho mais altos tendem a coincidir com preços de soja mais altos. A covariância positiva é coerente com esse comportamento. Como a covariância depende das escalas de medida, a correlação é a medida mais adequada para comparar a intensidade da associação.

#figure(
  image("figuras/dispersao_regressao.png", width: 82%),
  caption: [Dispersão dos preços e reta de regressão linear.],
)

== 3.2 Interpretação dos resultados

Os preços de soja e milho apresentaram comportamento positivamente associado e relativamente alinhado entre janeiro de 2014 e dezembro de 2015. A soja teve maior variabilidade em valores absolutos, enquanto o milho apresentou maior dispersão proporcional ao seu preço médio. A maior parte das observações permaneceu dentro dos limites do intervalo interquartil; apenas três valores de soja foram classificados como outliers.

Os resultados são descritivos e estão restritos às localidades, ao período e às definições de preço da base. A associação observada não demonstra causalidade. Fatores como clima, câmbio, custos, demanda, exportações e sazonalidade podem influenciar simultaneamente as duas séries.
