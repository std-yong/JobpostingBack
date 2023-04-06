from django.db import models

# Create your models here.
class Feed(models.Model):
    company_name        = models.CharField(max_length=200)
    company_image       = models.TextField()
    job_description     = models.TextField()
    job_poster          = models.TextField()
