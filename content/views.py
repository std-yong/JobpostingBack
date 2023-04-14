from django.shortcuts import render

# Create your views here.
from rest_framework import generics
from .models import Feed
from .serializers import FeedSerializer


class ListFeed(generics.ListAPIView):
    queryset = Feed.objects.all()
    serializer_class = FeedSerializer

class DetailFeed(generics.RetrieveAPIView):
    queryset = Feed.objects.all()
    serializer_class = FeedSerializer