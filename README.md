# Esse trabalho é uma forma de recuperar minha nota no primeiro bimestre na disciplina de Paradigmas de Programação 2023/2.

## A proposta se trata de um codigo que consome a API "Chuck Norris API" que é um gerador de piadas acerca do personagem fictício Chuck Norris, e gera algumas estatisticas sobre tais piadas, sendo elas: 
  ### - Qual a maior piada?
  ### - Qual a menor piada?
  ### - Qual o total de vezes que o nome 'Chuck Norris' foi mencionado nas piadas geradas?

## O projeto se divide em 3 arquivos:
  ### HttpResponse.hs:
   Esse arquivo é responsável por enviar a requisição HTTP para o endpoint da API em questão, obtendo o json das piadas, tal json contem alguns campos, sendo eles icon, id, url, value. O arquivo faz a requisição, obtém o json e faz o parse devido para colocar as respectivas informações do objeto nos campos que serão utilizados nesse projeto.

  ### Statistics.hs:
    Esse arquivo é responsável por lidar com os dados advindos do json previamente tratados e printar no terminal as estatisticas mencionadas anteriormente. 

  ### Main.hs:
    Esse arquivo é o arquivo principal onde o usuário irá escolher a quantidade de piadas que ele gostaria de ver, e também, se trata do arquivo onde terá que sofrer o comando "ghci [...]" para compilar ou clicar no botao superior para compilar e rodar.

Nesse link: https://replit.com/@elc117-2023b/extra-http-json-jpsousas

## Referências: 
- https://docs.github.com/pt/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
- https://hackage.haskell.org/package/text-2.1/docs/Data-Text.html
- https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-List.html
- https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Ord.html
- https://hackage.haskell.org/package/http-conduit-2.3.8.3/docs/Network-HTTP-Simple.html


# ScreenCast: https://drive.google.com/drive/folders/1M1eScfyFJV6jE4FYBrHkojVCuJU2UlOs?usp=sharing