docker run -it \
	-e 'ALERTMANAGER_URL=http://alertmanager:9093' \
	-e 'CONSUL_URL=localhost:8500' \
	-e 'STORE=consul' \
	-e 'TELEGRAM_ADMIN=xxxxxx' \
	-e 'TELEGRAM_TOKEN=xxxxxxxx:fdfdfdfdfdfd-fdfdfdfdfdfdfffdfd326965814' \
	--name alertmanager-bot \
	metalmatze/alertmanager-bot:0.4.2
