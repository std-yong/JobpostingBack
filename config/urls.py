from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/todo', include('todo.urls')),  #add to
    path('api/content', include('content.urls'))
]
