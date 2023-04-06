from django.urls import path, include
from .views import ListFeed, DetailFeed

urlpatterns = [
    path('<int:pk>/', DetailFeed.as_view()),
    path('', ListFeed.as_view())
]
