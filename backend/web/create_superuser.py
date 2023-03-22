import django
django.setup()
from django.contrib.auth import get_user_model

User = get_user_model()
User.objects.create_superuser('root', 'root@gmail.com', 'password')
