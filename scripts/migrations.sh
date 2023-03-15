#!/bin/bash
./manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | python manage.py shell
gunicorn -w 3 -b :8000 django_aws.wsgi:application
