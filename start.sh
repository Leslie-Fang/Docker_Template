uwsgi --http :9090 -s /tmp/yourapplication.sock --manage-script-name --mount /=myapp:app
