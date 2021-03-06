## Installation

Este projeto faz uso do [CocoaPods](https://cocoapods.org). Tudo o que você precisa para configurá-lo corretamente é:

```
pod install
```

Se necessário, atualizar os repositórios do CocoaPods:

```
pod repo update
```

## Projeto

Para os testes com snapshot foi utilizado a framework [snapshot](https://github.com/uber/ios-snapshot-test-case).

É preciso que o simulador cumpra os seguintes requisitos para o sucesso desses testes:

- iPhone 11;
- Configurado em inglês;

# Quero ser MB

### **O MB**
Somos a maior plataforma de negociação de criptomoedas e ativos alternativos da América Latina, criada para elevar a experiência de quem vivencia essa revolução, entregando o melhor serviço de negociação de ativos alternativos, com liberdade, segurança e liquidez. Sendo assim, nós existimos para mudar a maneira como as pessoas lidam com o dinheiro através da tecnologia.

### **Desafio**
Criar um aplicativo para consultar a [CoinAPI.io](https://docs.coinapi.io/#list-all-exchanges) e trazer as moedas em forma de lista. Fique livre para criar, porém pode também utilizar como base a tela principal do MB atualmente:

![IMG_4295](https://user-images.githubusercontent.com/63304092/99078009-6edc7680-259c-11eb-96cf-7ddd845b2c23.PNG)

### **Must Have**
-   **Lista de moedas**
	- Paginação com scroll infinito
    - Pull to refresh
    - Exibir, pelo menos, os campos: "name", "exchange_id" e "volume_1day_usd"
    - Ao tocar em um item, deve mostrar os detalhes da moeda
-   **Detalhe da moeda**
    - Criar uma tela que mostre mais informações sobre a moeda

### **Nice to Have**
- Adicionar imagens para as moedas e mantê-las em cache

### **Requisitos Técnicos (iOS)**
- MVVM-C
- Swift 5
- i18n (Localizable)
- View Code
- CocoaPods com Alamofire
- Codable
- Testes UI/Unitários
- Versão mínima: iOS 11
- gitignore

### **Processo de Submissão**
O candidato deverá enviar por e-mail a solução.

### **PS**
Importante frisar que esse código não será usado em nenhuma hipótese para qualquer fim a não ser o de avaliação dos conhecimentos do candidato.
