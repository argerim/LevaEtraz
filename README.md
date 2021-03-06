# Entregando mercadorias

A Companhia LevaEtraz está desenvolvendo um novo sistema de logistica e sua ajuda é muito importante neste momento. Sua tarefa será desenvolver o novo sistema de entregas visando sempre o menor custo. Para popular sua base de dados o sistema precisa expor um Webservices que aceite o formato de malha logística (exemplo abaixo), nesta mesma requisição o requisitante deverá informar um nome para este mapa. É importante que os mapas sejam persistidos para evitar que a cada novo deploy todas as informações desapareçam. O formato de malha logística é bastante simples, cada linha mostra uma rota: ponto de origem, ponto de destino e distância entre os pontos em quilômetros.

    A B 10
    B D 15
    A C 20
    C D 30
    B E 50
    D E 30

Com os mapas carregados o requisitante irá procurar o menor valor de entrega e seu caminho, para isso ele passará o mapa, nome do ponto de origem, nome do ponto de destino, autonomia do caminhão (km/l) e o valor do litro do combustivel, agora sua tarefa é criar este Webservices. Um exemplo de entrada seria, mapa SP, origem A, destino D, autonomia 10, valor do litro 2,50; a resposta seria a rota A B D com custo de 6,25.

Voce está livre para definir a melhor arquitetura e tecnologias para solucionar este desafio, mas não se esqueça de contar sua motivação no arquivo README que deve acompanhar sua solução, junto com os detalhes de como executar seu programa. Documentação e testes serão avaliados também =) Lembre-se de que iremos executar seu código com malhas beeemm mais complexas, por isso é importante pensar em requisitos não funcionais também!!

Também gostariamos de acompanhar o desenvolvimento da sua aplicação através do código fonte. Por isso, solicitamos a criação de um repositório (GitHub) que seja compartilhado com a gente. Para o desenvolvimento desse sistema, nós solicitamos que você utilize a sua (ou as suas) linguagem de programação principal. Pode ser Java, JavaScript, Ruby ou Grails. 

Nós solicitamos que você trabalhe no desenvolvimento desse sistema sozinho e não divulgue a solução desse problema pela internet.

bom desafio!

## Tecnologias

Para o desafio foi criado um Webservices (REST API) com o framework ruby on rails.

Principais gems do projeto: puma "(A Ruby Web Server)", rack-cors "(Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.)" e active_model_serializers "(serializar os dados)".

Para o problema do caminho mais curto foi usando o algoritimo de Dijkstra.

O projeto esta usando Ruby na versao 2.3.0 e como banco Postgres.

Segue logo abaixo os endpoints para teste da API.

## Ambiente de Desenvolvmento
    gem install bundler && bundle
    rake db:setup
    rails s

## Ambiente de Testes
    rake db:setup RAILS_ENV=test
    rspec spec

## Endpoints

**Endpoint listagem de mapas**

    curl -vL -X GET -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1"  http://localhost:3000/api/maps

**Endpoint criar mapa**

    curl -vL -X POST -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"map":{"name":"RJ"}}' http://localhost:3000/api/maps

**Endpoint atualizar mapa**

    curl -vL -X PUT -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"map":{"name": "PE"}}' http://localhost:3000/api/maps/1

**Endpoint deletar mapa**

    curl -vL -X DELETE -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" http://localhost:3000/api/maps/1

**Endpoint listagem de cidades**

    curl -vL -X GET -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1"  http://localhost:3000/api/cities

**Endpoint criar cidade**

    curl -vL -X POST -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"city":{"name":"A"}, "map_name": "SP"}' http://localhost:3000/api/cities

**Endpoint atualizar cidade**

    curl -vL -X PUT -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"city":{"name": "B"}, "map_name": "SP"}' http://localhost:3000/api/cities/1

**Endpoint deletar cidade**

    curl -vL -X DELETE -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" http://localhost:3000/api/cities/1

**Endpoint criar rota**

    curl -vL -X POST -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"route":{"origin":"A", "destination":"B", "map":"SP", "distance":"10"}}' http://localhost:3000/api/routes

**Endpoint caminho mais curto**

    curl -vL -X GET -H "Content-Type:application/json" -H "Accept: application/vnd.levaetraz.v1" -d '{"shortest_path":{"origin":"A", "destination":"D", "autonomy": 10, "fuel_prices": "2,5"}}' http://localhost:3000/api/shortest_path