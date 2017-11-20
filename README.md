# Fabrica De Massas Chef Nery

 <a href="https://travis-ci.org/naiieandrade/FabricaDeMassas-ChefNery/"><img src="https://api.travis-ci.org/naiieandrade/FabricaDeMassas-ChefNery.svg?branch=master"></a>
 
## Descrição do Projeto

Para o trabalho foi utilizado o projeto realizado na matéria de Desenho de Software no 1º/2017, que segue o repositório original: https://github.com/miguelpimentel/FabricaDeMassas-ChefNery

### Integrantes

|Nome|Matricula|
|---|----|
|Matheus Figueiredo| 14/0047743|
|Naiara Andrade| 15/0043449|

### Deploy

|Logo|Ferramenta|Link|
|---|----|---|
|<img src="https://maxcdn.icons8.com/Color/PNG/512/Logos/heroku-512.png" width="50">| Heroku| https://fabricadochefnery.herokuapp.com/ |


### Integração Contínua

|Logo|Ferramenta|Link|
|---|----|---|
|<img src="https://travis-ci.org/images/logos/TravisCI-Mascot-1.png" width="50">| Travis | https://travis-ci.org/naiieandrade/FabricaDeMassas-ChefNery/ |

### Empacotamento

Para o projeto foi feita a seguinte Gem:

https://rubygems.org/gems/loka

E adicionada no Gemfile. Para execução da gem, segue as instruções:

```
require 'loka'
hello = Hello.new
hello.say!
=> Hello!
```

## Ambiente

Este projeto pode ser executado pelo Docker ou pelo Vagrant.

### Vagrant

Pré Requisito:

* Ter o VirtualBox instalado;
* Ter o Vagrant instalado;


Os comandos abaixo foram voltados para usuários que utilizam o sistema operacional Linux.

Para o projeto deve se baixar o repositório ou clonar com o seguinte comando:

```git clone https://github.com/naiieandrade/FabricaDeMassas-ChefNery```

Na pasta do projeto:

```
vagrant init
vagrant up
cd /vagrant
```

Após configurar o vangrant, rode os seguintes comandos na máquina virtual. 

Para estruturar o banco de dados:

```rails db:migrate```

Para rodar o servidor localmente:

```rails s -b 0.0.0.0```

Acesse a aplicação através do link: http://0.0.0.0:3000

### Docker 

