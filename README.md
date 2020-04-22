# Alertmanager + Prometheus + Telegram

## Motivação

Esse é um fork do projeto https://github.com/fabricioveronez/metricasapi , usando as mesmas imagens que nosso amigo Fabricio Veronez fez no projeto inicial.

O video abaixo mostra detalhadamente a instalação e configuração do Prometheus integrado com slack.

https://www.youtube.com/watch?v=Hw4pfW4734E

## Objetivo

O objetivo deste projeto é fazer essa switch funcionar usando Telegram.

### Procedimentos

```
git clone https://github.com/Paulo-Rogerio/alertmanager-prometheus-telegram.git
```

Altere suas credenciais do Telegram, sendo TELEGRAM_ADMIN é ***SEU CHAT_ID*** e 
TELEGRAM_TOKEN é ***TOKEN*** .

```
      TELEGRAM_ADMIN: '22222'
      TELEGRAM_TOKEN: xxxxxxxxx:Yyyyyyyyyyyyyyyyyyyyyyyyyyy
```      

Inicie os containers.

```
./start.sh
```

Validar arquivos de configuração.

```
docker ps 

CONTAINER ID        IMAGE                            
b0050c8be274        prom/prometheus                     
e1e42929d9ed        fabricioveronez/metricasapi         
9dec6cb5a159        fabricioveronez/mongo_exporter      
99fe525e4a2e        mongo:4.2.1                         
c9f984a0b241        prom/alertmanager                   
076545a3aa40        metalmatze/alertmanager-bot:0.4.2   
```
Conectar na imagem do prometheus.

```
docker exec -it b0050c8be274 sh
/bin/promtool check config /etc/prometheus/prometheus.yml
Checking /etc/prometheus/prometheus.yml
  SUCCESS: 1 rule files found

Checking /etc/prometheus/mongoDBAlertaRules.yaml
  SUCCESS: 1 rules found
```

Conectar na imagem do alertmanager.

```
docker exec -it c9f984a0b241 sh
/bin/amtool check-config /prometheus/alertmanager.yml

Checking '/prometheus/alertmanager.yml'  SUCCESS
Found:
 - global config
 - route
 - 0 inhibit rules
 - 1 receivers
 - 0 templates
```

Abra seu cliente Telegram e interaja com seu Bot.

```
/start
```

Interrompa o serviço do container ***mongodb-exporter*** 

```
docker stop 9dec6cb5a159
```

Abra o browser e acompanhe o fluxo.

Prometheus: http://localhost:9090
Alert Manager: http://localhost:9093 
