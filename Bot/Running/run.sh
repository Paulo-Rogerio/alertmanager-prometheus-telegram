docker run --rm -it \
    -p 8899:8899 \
    -e TELEGRAM_TOKEN="0000000:AAjfkdjfkldjflkdjflkdjaflk" \
    -e TELEGRAM_CHAT_ID="444444444" \
    -e EXCLUDE_LABELS="yes" \
    --name alertmanager-notifier \
    ixdotai/alertmanager-notifier:latest

