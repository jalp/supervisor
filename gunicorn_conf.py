import multiprocessing

bind = '0.0.0.0:5000'
workers = multiprocessing.cpu_count() * 2 + 1
worker_class = 'sync'
loglevel = 'debug'
backlog = 2048
errorlog = '/var/log/gunicorn-error.log'
accesslog = '/var/log/gunicorn-access.log'
