uwsgi --socket 127.0.0.1:3031 --wsgi-file myapp.py --callable app --processes 4 --threads 2 --stats 127.0.0.1:9191
